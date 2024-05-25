import 'package:cmp_app/core/helpers/cache_helper.dart';
import 'package:cmp_app/core/helpers/dio_helper.dart';
import 'package:cmp_app/features/login/model.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitialState());

  static LoginCubit get(context) => BlocProvider.of(context);

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool isPassword = true;

  Future<void> loginUser(
      {required String email, required String password}) async {
    try {
      emit(LoginLoadingState());
      bool? isEmailVerified = FirebaseAuth.instance.currentUser?.emailVerified;
      UserCredential user = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);

      if (isEmailVerified == true) {
        Response response = await DioManager().post(
            "https://camp-coding.site/as_graduation/user/home/login.php",
            data: {
              "email":email,
              "password":password
            });

        LoginModel loginModel = LoginModel.fromJson(response.data);

        if (loginModel.status == 'success') {
          CacheHelper.saveId(loginModel.data?.userId??'0');
          emit(LoginSuccessState(loginModel: loginModel));
        } else {
          emit(LoginFailureState(stateMsg: "Something went wrong, please try again"));
        }
      } else {
        emit(LoginFailureState(stateMsg: 'Please verify your acc.'));
      }
    } on FirebaseAuthException catch (ex) {
      emit(LoginFailureState(stateMsg: ex.code.toString()));
    }
  }

  changeVisibility() {
    isPassword = !isPassword;
    emit(VisibilityChangeState());
  }
}
