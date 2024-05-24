part of 'task_details_cubit.dart';

abstract class TaskDetailsState extends Equatable {
  const TaskDetailsState();
}

class TaskDetailsInitial extends TaskDetailsState {
  @override
  List<Object> get props => [];
}

class TaskDetailsLoadingState extends TaskDetailsState {
  @override
  List<Object> get props => [];
}

class TaskDetailsSuccessState extends TaskDetailsState {
  final TaskDetailsModel taskDetailsModel;

  const TaskDetailsSuccessState(this.taskDetailsModel);

  @override
  List<Object> get props => [taskDetailsModel];
}

class TaskDetailsErrorState extends TaskDetailsState {
  final String message;

  const TaskDetailsErrorState(this.message);

  @override
  List<Object> get props => [message];
}

class FinishUnFinishSubTaskLoadingState extends TaskDetailsState {
  @override
  List<Object> get props => [];
}

class FinishUnFinishSubTaskSuccessState extends TaskDetailsState {
  final BaseModel finishSubTaskModel;

  const FinishUnFinishSubTaskSuccessState(this.finishSubTaskModel);

  @override
  List<Object> get props => [finishSubTaskModel];
}

class FinishUnFinishSubTaskErrorState extends TaskDetailsState {
  final String message;

  const FinishUnFinishSubTaskErrorState(this.message);

  @override
  List<Object> get props => [message];
}