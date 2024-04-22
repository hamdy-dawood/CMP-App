import 'package:cmp_app/core/helpers/navigator.dart';
import 'package:cmp_app/core/theming/assets.dart';
import 'package:cmp_app/core/theming/colors.dart';
import 'package:cmp_app/core/widgets/custom_elevated.dart';
import 'package:cmp_app/core/widgets/custom_text.dart';
import 'package:cmp_app/core/widgets/custom_text_form_field.dart';
import 'package:cmp_app/core/widgets/snack_bar.dart';
import 'package:cmp_app/features/login/view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'cubit.dart';
import 'states.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: const _RegisterBody(),
    );
  }
}

class _RegisterBody extends StatelessWidget {
  const _RegisterBody();

  @override
  Widget build(BuildContext context) {
    final cubit = RegisterCubit.get(context);

    return Scaffold(
      backgroundColor: ColorManager.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Form(
          key: cubit.formKey,
          autovalidateMode: AutovalidateMode.disabled,
          child: ListView(
            children: [
              Image.asset(
                AssetsStrings.authImage,
                height: 300.h,
              ),
              _UsernameTextField(
                usernameController: cubit.usernameController,
              ),
              SizedBox(height: 12.h),
              _EmailTextField(
                emailController: cubit.emailController,
              ),
              SizedBox(height: 12.h),
              _PasswordTextField(
                passwordController: cubit.passwordController,
              ),
              SizedBox(height: 12.h),
              _ConfirmPasswordTextField(
                confirmPasswordController: cubit.confirmPasswordController,
                passwordController: cubit.passwordController,
              ),
              BlocBuilder<RegisterCubit, RegisterStates>(
                builder: (context, state) {
                  return Row(
                    children: [
                      Checkbox(
                        value: cubit.isChecked,
                        onChanged: (_) {
                          cubit.rememberCheckBox();
                        },
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(3.r),
                        ),
                        side: BorderSide(
                          width: 1.5.w,
                          color: ColorManager.mainColor,
                        ),
                        activeColor: ColorManager.mainColor,
                      ),
                      GestureDetector(
                        onTap: () {
                          cubit.rememberCheckBox();
                        },
                        child: CustomText(
                          text: "I agree to terms & Conditions",
                          color: ColorManager.grey,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  );
                },
              ),
              BlocConsumer<RegisterCubit, RegisterStates>(
                listener: (context, state) {
                  if (state is RegisterFailureState) {
                    showMessage(
                      message: state.stateMsg,
                      color: ColorManager.red,
                    );
                  } else if (state is RegisterSuccessState) {
                    final auth = FirebaseAuth.instance;
                    late User user;
                    user = auth.currentUser!;

                    showMessage(
                      message: "Register success Please Login After Verify",
                      color: ColorManager.greyIndicator,
                    );
                    MagicRouter.navigateTo(
                      page: const LoginView(),
                      withHistory: false,
                    );

                    user.sendEmailVerification();
                  }
                },
                builder: (context, state) {
                  if (state is RegisterLoadingState) {
                    return Center(
                      child: CircularProgressIndicator(
                        color: ColorManager.mainColor,
                      ),
                    );
                  }
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 0.18.sw),
                    child: CustomElevated(
                      text: "Sign Up",
                      press: () {
                        if (cubit.formKey.currentState!.validate() &&
                            cubit.isChecked) {
                          cubit.registerUser(
                            email: cubit.emailController.text,
                            password: cubit.passwordController.text,
                          );
                        }
                      },
                      btnColor: ColorManager.mainColor,
                    ),
                  );
                },
              ),
              SizedBox(height: 50.h),
            ],
          ),
        ),
      ),
    );
  }
}

class _UsernameTextField extends StatelessWidget {
  const _UsernameTextField({required this.usernameController});

  final TextEditingController usernameController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: "Username",
          color: ColorManager.grey,
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
        ),
        SizedBox(height: 5.h),
        CustomTextFormField(
          controller: usernameController,
          keyboardType: TextInputType.emailAddress,
          hint: "Enter Your Username",
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "Please Enter Your Username !";
            }
            return null;
          },
        ),
      ],
    );
  }
}

class _EmailTextField extends StatelessWidget {
  const _EmailTextField({required this.emailController});

  final TextEditingController emailController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: "Email",
          color: ColorManager.grey,
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
        ),
        SizedBox(height: 5.h),
        CustomTextFormField(
          controller: emailController,
          keyboardType: TextInputType.emailAddress,
          hint: "Enter Your Email",
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "Please Enter Your Email !";
            }
            return null;
          },
        ),
      ],
    );
  }
}

class _PasswordTextField extends StatelessWidget {
  const _PasswordTextField({required this.passwordController});

  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: "Password",
          color: ColorManager.grey,
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
        ),
        SizedBox(height: 5.h),
        CustomTextFormField(
          controller: passwordController,
          hint: "Enter Your Password",
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "Please Enter Your Password !";
            }
            return null;
          },
        ),
      ],
    );
  }
}

class _ConfirmPasswordTextField extends StatelessWidget {
  const _ConfirmPasswordTextField({
    required this.confirmPasswordController,
    required this.passwordController,
  });

  final TextEditingController confirmPasswordController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: "Confirm Password",
          color: ColorManager.grey,
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
        ),
        SizedBox(height: 5.h),
        CustomTextFormField(
          controller: confirmPasswordController,
          hint: "Enter Your Confirm Password",
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "Please Enter Your Confirm Password !";
            } else if (value != passwordController.text) {
              return "Password Not the Same !";
            }
            return null;
          },
          isLastInput: true,
        ),
      ],
    );
  }
}
