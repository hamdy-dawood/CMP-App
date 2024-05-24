part of 'covenants_cubit.dart';

abstract class CovenantsState extends Equatable {
  const CovenantsState();
}

class CovenantsInitial extends CovenantsState {
  @override
  List<Object> get props => [];
}


class CovenantsLoadingState extends CovenantsState {
  @override
  List<Object> get props => [];
}

class CovenantsSuccessState extends CovenantsState {
  final CovenantsModel covenantsModel;

  const CovenantsSuccessState(this.covenantsModel);

  @override
  List<Object> get props => [covenantsModel];
}

class CovenantsErrorState extends CovenantsState {
  final String message;

  const CovenantsErrorState(this.message);

  @override
  List<Object> get props => [message];
}

class CheckUnCheckConvenantsLoadingState extends CovenantsState {
  @override
  List<Object> get props => [];
}

class CheckUnCheckConvenantsSuccessState extends CovenantsState {
  final BaseModel finishSubTaskModel;

  const CheckUnCheckConvenantsSuccessState(this.finishSubTaskModel);

  @override
  List<Object> get props => [finishSubTaskModel];
}

class CheckUnCheckConvenantsErrorState extends CovenantsState {
  final String message;

  const CheckUnCheckConvenantsErrorState(this.message);

  @override
  List<Object> get props => [message];
}