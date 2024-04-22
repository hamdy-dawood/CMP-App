import 'package:cmp_app/core/helpers/cache_helper.dart';
import 'package:cmp_app/core/helpers/navigator.dart';
import 'package:cmp_app/core/theming/assets.dart';
import 'package:cmp_app/core/theming/colors.dart';
import 'package:cmp_app/core/widgets/custom_elevated.dart';
import 'package:cmp_app/core/widgets/custom_text.dart';
import 'package:cmp_app/core/widgets/custom_text_form_field.dart';
import 'package:cmp_app/core/widgets/snack_bar.dart';
import 'package:cmp_app/features/bottom_nav_bar/view.dart';
import 'package:cmp_app/features/forgot_password/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'cubit.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: const _LoginBody(),
    );
  }
}

class _LoginBody extends StatelessWidget {
  const _LoginBody();

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<LoginCubit>(context);

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
                height: 350.h,
              ),
              _EmailTextField(
                emailController: cubit.emailController,
              ),
              SizedBox(height: 12.h),
              _PasswordTextField(
                passwordController: cubit.passwordController,
              ),
              Padding(
                padding: EdgeInsets.only(top: 10.h, bottom: 16.h),
                child: GestureDetector(
                  onTap: () {
                    MagicRouter.navigateTo(page: const ForgotPasswordView());
                  },
                  child: CustomText(
                    text: "FORGOT PASSWORD ?",
                    color: ColorManager.mainColor,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              BlocConsumer<LoginCubit, LoginState>(
                listener: (context, state) {
                  if (state is LoginFailureState) {
                    showMessage(
                      message: state.stateMsg,
                      color: ColorManager.red,
                    );
                  } else if (state is LoginSuccessState) {
                    CacheHelper.saveName(cubit.emailController.text);
                    MagicRouter.navigateTo(
                      page: const NavBarView(),
                      withHistory: false,
                    );
                  }
                },
                builder: (context, state) {
                  if (state is LoginLoadingState) {
                    return Center(
                      child: CircularProgressIndicator(
                        color: ColorManager.mainColor,
                      ),
                    );
                  }
                  return CustomElevated(
                    text: "Sign In",
                    press: () {
                      if (cubit.formKey.currentState!.validate()) {
                        cubit.loginUser(
                          email: cubit.emailController.text,
                          password: cubit.passwordController.text,
                        );
                      }
                    },
                    btnColor: ColorManager.mainColor,
                  );
                },
              ),
            ],
          ),
        ),
      ),
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
          isLastInput: true,
        ),
      ],
    );
  }
}
