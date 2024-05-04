import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'states.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(RegisterInitialState());

  static RegisterCubit get(context) => BlocProvider.of(context);

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  bool isChecked = false;

  Future<void> registerUser({
    required String email,
    required String password,
  }) async {
    emit(RegisterLoadingState());
    try {
      UserCredential user = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      FirebaseFirestore.instance.collection("Users").doc(user.user!.uid).set(
        {
          'uid': user.user!.uid,
          'email': email,
          'username': usernameController.text,
        },
      );
      emit(RegisterSuccessState());
    } on FirebaseAuthException catch (ex) {
      emit(RegisterFailureState(stateMsg: ex.code.toString()));
    } catch (e) {
      emit(RegisterFailureState(stateMsg: e.toString()));
    }
  }

  rememberCheckBox() {
    isChecked = !isChecked;
    emit(ChanceCheckBoxState());
  }

  @override
  Future<void> close() {
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    return super.close();
  }
}
