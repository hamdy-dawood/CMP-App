part of 'upload_file_cubit.dart';

abstract class UploadFileState extends Equatable {
  const UploadFileState();
}

class UploadFileInitial extends UploadFileState {
  @override
  List<Object> get props => [];
}

class UploadFileLoadingState extends UploadFileState {
  @override
  List<Object> get props => [];
}

class UploadFileSuccessState extends UploadFileState {
  final String fileUrl;

  const UploadFileSuccessState(this.fileUrl);

  @override
  List<Object> get props => [fileUrl];
}

class UploadFileErrorState extends UploadFileState {
  final String message;

  const UploadFileErrorState(this.message);

  @override
  List<Object> get props => [message];
}

class UploadTaskDataLoadingState extends UploadFileState {
  @override
  List<Object> get props => [];
}

class UploadTaskDataSuccessState extends UploadFileState {
  final BaseModel baseModel;

  const UploadTaskDataSuccessState(this.baseModel);

  @override
  List<Object> get props => [baseModel];
}

class UploadTaskDataErrorState extends UploadFileState {
  final String message;

  const UploadTaskDataErrorState(this.message);

  @override
  List<Object> get props => [message];
}