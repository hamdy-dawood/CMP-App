import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cmp_app/core/helpers/cache_helper.dart';
import 'package:cmp_app/core/helpers/dio_helper.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

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

  final dioManager = DioManager();
  File? profileImage;
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

  Future<void> imageRegister() async {
    emit(RegisterLoadingState());
    try {
      final response = await dioManager.post(
        "https://camp-coding.site/as_graduation/user/home/image_uplouder.php",
        data: FormData.fromMap(
          {
            "image": profileImage != null
                ? MultipartFile.fromFileSync(
                    profileImage!.path,
                    filename: profileImage!.path.split("/").last,
                  )
                : null,
          },
        ),
      );

      if (response.statusCode == 200) {
        emit(AllRegisterSuccessState());
        print("image:${response.data}");
        CacheHelper.saveImage("${response.data.replaceAll('"', '')}");
      } else {
        emit(RegisterFailureState(stateMsg: response.data));
      }
    } on DioException catch (e) {
      emit(RegisterFailureState(stateMsg: 'DioException error: $e'));
    } catch (e) {
      emit(RegisterFailureState(stateMsg: 'An unknown error: $e'));
    }
  }

  rememberCheckBox() {
    isChecked = !isChecked;
    emit(ChanceCheckBoxState());
  }

  chooseImage({ImageSource? source}) {
    ImagePicker.platform.getImage(source: source!).then((value) {
      if (value != null) {
        profileImage = File(value.path);
        emit(UploadImageStates());
      }
    });
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
