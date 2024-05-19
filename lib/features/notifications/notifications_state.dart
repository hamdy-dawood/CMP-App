part of 'notifications_cubit.dart';

abstract class NotificationsState extends Equatable {
  const NotificationsState();
}

class NotificationsInitial extends NotificationsState {
  @override
  List<Object> get props => [];
}

class NotificationsLoadingState extends NotificationsState {
  @override
  List<Object> get props => [];
}

class NotificationsSuccessState extends NotificationsState {
  final NotificationsModel notificationsModel;

  const NotificationsSuccessState(this.notificationsModel);

  @override
  List<Object> get props => [notificationsModel];
}

class NotificationsErrorState extends NotificationsState {
  final String message;

  const NotificationsErrorState(this.message);

  @override
  List<Object> get props => [message];
}