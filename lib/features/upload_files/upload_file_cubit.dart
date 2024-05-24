import 'package:bloc/bloc.dart';
import 'package:cmp_app/core/base_model/base_model.dart';
import 'package:cmp_app/core/helpers/cache_helper.dart';
import 'package:cmp_app/core/helpers/dio_helper.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

part 'upload_file_state.dart';

class UploadFileCubit extends Cubit<UploadFileState> {
  UploadFileCubit() : super(UploadFileInitial());


  Future<void> uploadFile({
    required String filePath,
  }) async {
    FormData formData = FormData();
    emit(UploadFileLoadingState());
    formData.files.add(MapEntry('file_attachment', await MultipartFile.fromFile(filePath)));
    try {
      Response response = await DioManager().post(
          "https://camp-coding.site/as_graduation/user/home/uploud_pdf.php",
          data: formData,
      );

      String url = response.data;
      emit(UploadFileSuccessState(url));

    }catch (e){
      emit(const UploadFileErrorState("Something went wrong, please try again"));
    }
  }

  Future<void> uploadTaskData({
    required String link,
    required String subTaskId,
    required String taskId,
  }) async {

    emit(UploadTaskDataLoadingState());
    try {
      Response response = await DioManager().post(
        "https://camp-coding.site/as_graduation/user/home/upload_task_data.php",
        data: {
          "user_id":CacheHelper.getId(),
          "task_id":taskId,
          "sub_task_id":subTaskId,
          "confirm_data_link":link,
          "type":"file"
        },
      );

      BaseModel baseModel = BaseModel.fromJson(response.data);

      if(baseModel.status == 'success') {
        emit(UploadTaskDataSuccessState(baseModel));
      }else{
        emit(UploadFileErrorState(baseModel.message??''));
      }
    }catch (e){
      emit(const UploadFileErrorState("Something went wrong, please try again"));
    }
  }
}
