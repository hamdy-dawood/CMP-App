import 'package:bloc/bloc.dart';
import 'package:cmp_app/core/base_model/base_model.dart';
import 'package:cmp_app/core/helpers/cache_helper.dart';
import 'package:cmp_app/core/helpers/dio_helper.dart';
import 'package:cmp_app/features/task_details/model.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

part 'task_details_state.dart';

class TaskDetailsCubit extends Cubit<TaskDetailsState> {
  TaskDetailsCubit() : super(TaskDetailsInitial());

  String selectedSubTask = '';

  TaskDetailsModel? taskDetailsModel;

  Future<void> getTaskDetails(String taskId) async {
    if(taskDetailsModel == null) {
      emit(TaskDetailsLoadingState());
    }
    try {
      Response response = await DioManager().post(
          "https://camp-coding.site/as_graduation/user/home/select_task_data.php",
          data: {
            "task_id": taskId,
          });

      taskDetailsModel = TaskDetailsModel.fromJson(response.data);

      // if (taskDetailsModel.status == 'success') {
        emit(TaskDetailsSuccessState(taskDetailsModel!));
      // } else {
      //   emit(const TaskDetailsErrorState("Something went wrong, please try again"));
      // }
    }catch (e){
      emit(const TaskDetailsErrorState("Something went wrong, please try again"));
    }
  }

  Future<void> finishSubTask({
    required String taskId,
    required String subTaskId,
  }) async {
    emit(FinishUnFinishSubTaskLoadingState());
    try {
      Response response = await DioManager().post(
          "https://camp-coding.site/as_graduation/user/home/finish_task.php",
          data: {
            "user_id": CacheHelper.getId(),
            "task_id": taskId,
            "sub_task_id": subTaskId,
            "type": "sub_task"
          });

      BaseModel baseModel = BaseModel.fromJson(response.data);

      if (baseModel.status == 'success') {
        await getTaskDetails(taskId);
        selectedSubTask = '';
      emit(FinishUnFinishSubTaskSuccessState(baseModel));
      } else {
        selectedSubTask = '';
        emit(FinishUnFinishSubTaskErrorState(baseModel.message??''));
      }
    }catch (e){
      selectedSubTask = '';
      emit(const FinishUnFinishSubTaskErrorState("Something went wrong, please try again"));
    }
  }

  Future<void> unFinishSubTask({
    required String taskId,
    required String subTaskId,
  }) async {
    emit(FinishUnFinishSubTaskLoadingState());
    try {
      Response response = await DioManager().post(
          "https://camp-coding.site/as_graduation/user/home/un_finish_task.php",
          data: {
            "user_id": CacheHelper.getId(),
            "task_id": taskId,
            "sub_task_id": subTaskId,
            "type": "sub_task"
          });

      BaseModel baseModel = BaseModel.fromJson(response.data);

      if (baseModel.status == 'success') {
        await getTaskDetails(taskId);
        selectedSubTask = '';
        emit(FinishUnFinishSubTaskSuccessState(baseModel));
      } else {
        selectedSubTask = '';
        emit(FinishUnFinishSubTaskErrorState(baseModel.message??''));
      }
    }catch (e){
      selectedSubTask = '';
      emit(const FinishUnFinishSubTaskErrorState("Something went wrong, please try again"));
    }
  }
}
