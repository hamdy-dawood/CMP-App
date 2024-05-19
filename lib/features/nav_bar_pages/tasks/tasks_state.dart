part of 'tasks_cubit.dart';

abstract class TasksState extends Equatable {
  const TasksState();
}

class TasksInitial extends TasksState {
  @override
  List<Object> get props => [];
}

class TasksLoadingState extends TasksState {
  @override
  List<Object> get props => [];
}

class TasksSuccessState extends TasksState {
  final TasksModel tasksModel;
  final List<Task> todayTasks;

  const TasksSuccessState(this.tasksModel, this.todayTasks);

  @override
  List<Object> get props => [tasksModel,todayTasks];
}

class TasksErrorState extends TasksState {
  final String message;

  const TasksErrorState(this.message);

  @override
  List<Object> get props => [message];
}
