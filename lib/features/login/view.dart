import 'package:cmp_app/core/helpers/navigator.dart';
import 'package:cmp_app/core/theming/assets.dart';
import 'package:cmp_app/core/theming/colors.dart';
import 'package:cmp_app/core/widgets/custom_elevated.dart';
import 'package:cmp_app/core/widgets/custom_text.dart';
import 'package:cmp_app/core/widgets/custom_text_form_field.dart';
import 'package:cmp_app/features/bottom_nav_bar/view.dart';
import 'package:cmp_app/features/forgot_password/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    return Scaffold(
      backgroundColor: ColorManager.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Form(
          key: formKey,
          autovalidateMode: AutovalidateMode.disabled,
          child: ListView(
            children: [
              Image.asset(
                AssetsStrings.authImage,
                height: 350.h,
              ),
              _EmailTextField(
                emailController: emailController,
              ),
              SizedBox(height: 12.h),
              _PasswordTextField(
                passwordController: passwordController,
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
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              CustomElevated(
                text: "Sign In",
                press: () {
                  if (formKey.currentState!.validate()) {
                    MagicRouter.navigateTo(page: const NavBarView());
                  }
                },
                btnColor: ColorManager.mainColor,
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
