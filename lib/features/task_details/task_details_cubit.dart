import 'package:bloc/bloc.dart';
import 'package:cmp_app/core/helpers/dio_helper.dart';
import 'package:cmp_app/features/task_details/model.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

part 'task_details_state.dart';

class TaskDetailsCubit extends Cubit<TaskDetailsState> {
  TaskDetailsCubit() : super(TaskDetailsInitial());

  Future<void> getTaskDetails(String taskId) async {
    emit(TaskDetailsLoadingState());
    try {
      Response response = await DioManager().post(
          "https://camp-coding.site/as_graduation/user/home/select_sub_tasks.php",
          data: {
            "task_id": taskId,
          });

      TaskDetailsModel taskDetailsModel = TaskDetailsModel.fromJson(response.data);

      if (taskDetailsModel.status == 'success') {
        emit(TaskDetailsSuccessState(taskDetailsModel));
      } else {
        emit(const TaskDetailsErrorState("Something went wrong, please try again"));
      }
    }catch (e){
      emit(const TaskDetailsErrorState("Something went wrong, please try again"));
    }
  }
}
