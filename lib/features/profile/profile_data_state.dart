part of 'profile_data_cubit.dart';

abstract class ProfileDataState extends Equatable {
  const ProfileDataState();
}

class ProfileDataInitial extends ProfileDataState {
  @override
  List<Object> get props => [];
}

class ProfileDataLoadingState extends ProfileDataState {
  @override
  List<Object> get props => [];
}

class ProfileDataSuccessState extends ProfileDataState {
  final ProfileDataModel profileDataModel;

  const ProfileDataSuccessState(this.profileDataModel);

  @override
  List<Object> get props => [profileDataModel];
}

class ProfileDataErrorState extends ProfileDataState {
  final String message;

  const ProfileDataErrorState(this.message);

  @override
  List<Object> get props => [message];
}