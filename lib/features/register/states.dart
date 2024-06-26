abstract class RegisterStates {}

class RegisterInitialState extends RegisterStates {}

class RegisterLoadingState extends RegisterStates {}

class RegisterSuccessState extends RegisterStates {}

class AllRegisterSuccessState extends RegisterStates {}

class RegisterFailureState extends RegisterStates {
  final String stateMsg;

  RegisterFailureState({required this.stateMsg});
}

class ChanceCheckBoxState extends RegisterStates {}

class UploadImageStates extends RegisterStates {}
