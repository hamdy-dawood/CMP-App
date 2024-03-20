import 'package:cmp_app/core/helpers/navigator.dart';
import 'package:cmp_app/core/theming/assets.dart';
import 'package:cmp_app/core/theming/colors.dart';
import 'package:cmp_app/core/widgets/custom_elevated.dart';
import 'package:cmp_app/core/widgets/custom_text.dart';
import 'package:cmp_app/core/widgets/custom_text_form_field.dart';
import 'package:cmp_app/features/bottom_nav_bar/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ResetPasswordView extends StatelessWidget {
  const ResetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    final TextEditingController passwordController = TextEditingController();
    final TextEditingController confirmPasswordController =
        TextEditingController();

    return Scaffold(
      backgroundColor: ColorManager.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Form(
          key: formKey,
          autovalidateMode: AutovalidateMode.disabled,
          child: ListView(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 20.h, bottom: 20.h),
                child: Image.asset(
                  AssetsStrings.forgotPassImage,
                  height: 350.h,
                ),
              ),
              _PasswordTextField(
                passwordController: passwordController,
              ),
              SizedBox(height: 12.h),
              _ConfirmPasswordTextField(
                confirmPasswordController: confirmPasswordController,
                passwordController: passwordController,
              ),
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 0.18.sw, vertical: 50),
                child: CustomElevated(
                  text: "LOGIN",
                  press: () {
                    if (formKey.currentState!.validate()) {
                      MagicRouter.navigateTo(page: const NavBarView());
                    }
                  },
                  btnColor: ColorManager.mainColor,
                ),
              ),
            ],
          ),
        ),
      ),
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
          text: "New password",
          color: ColorManager.grey,
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
        ),
        SizedBox(height: 5.h),
        CustomTextFormField(
          controller: passwordController,
          hint: "Enter Your New password",
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "Please Enter Your New password !";
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
          text: "Password Again",
          color: ColorManager.grey,
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
        ),
        SizedBox(height: 5.h),
        CustomTextFormField(
          controller: confirmPasswordController,
          hint: "Enter Your  Password Again",
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "Please Enter Your  Password !";
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
