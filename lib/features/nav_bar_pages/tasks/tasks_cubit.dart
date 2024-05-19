import 'package:bloc/bloc.dart';
import 'package:cmp_app/core/helpers/cache_helper.dart';
import 'package:cmp_app/core/helpers/dio_helper.dart';
import 'package:cmp_app/features/nav_bar_pages/tasks/model.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

part 'tasks_state.dart';

class TasksCubit extends Cubit<TasksState> {
  TasksCubit() : super(TasksInitial());

  Future<void> getTasks() async {
    emit(TasksLoadingState());
    try {
      Response response = await DioManager().post(
          "https://camp-coding.site/as_graduation/user/home/select_tasks.php",
          data: {
            "user_id": CacheHelper.getId(),
          });

      TasksModel tasksModel = TasksModel.fromJson(response.data);

      if (tasksModel.status == 'success') {
        List<Task> todayTasks = (tasksModel.message??[]).where((element) => element.day == DateTime.now().toString().split(' ')[0]).toList();
        emit(TasksSuccessState(tasksModel,todayTasks));
      } else {
        emit(const TasksErrorState("Something went wrong, please try again"));
      }
    }catch (e){
      emit(const TasksErrorState("Something went wrong, please try again"));
    }
  }
}
