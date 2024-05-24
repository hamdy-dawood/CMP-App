part of 'home_cubit.dart';

abstract class HomeState extends Equatable {
  const HomeState();
}

class HomeInitial extends HomeState {
  @override
  List<Object> get props => [];
}

class HomeLoadingState extends HomeState {
  @override
  List<Object> get props => [];
}

class HomeSuccessState extends HomeState {
  final HomeModel homeModel;

  const HomeSuccessState(this.homeModel);

  @override
  List<Object> get props => [homeModel];
}

class HomeErrorState extends HomeState {
  final String message;

  const HomeErrorState(this.message);

  @override
  List<Object> get props => [message];
}