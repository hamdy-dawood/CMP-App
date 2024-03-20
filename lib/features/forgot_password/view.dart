import 'package:cmp_app/core/helpers/navigator.dart';
import 'package:cmp_app/core/theming/assets.dart';
import 'package:cmp_app/core/theming/colors.dart';
import 'package:cmp_app/core/widgets/custom_elevated.dart';
import 'package:cmp_app/core/widgets/custom_text.dart';
import 'package:cmp_app/core/widgets/custom_text_form_field.dart';
import 'package:cmp_app/features/otp/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    final TextEditingController phoneController = TextEditingController();

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
              CustomText(
                text: "Forgot password ?",
                color: ColorManager.mainColor,
                fontSize: 26.sp,
                fontWeight: FontWeight.w400,
              ),
              SizedBox(height: 5.h),
              CustomText(
                text:
                    "Don’t worry it happens. please enter the address associated with your account.",
                color: ColorManager.grey,
                fontSize: 18.sp,
                fontWeight: FontWeight.w400,
                maxLines: 4,
              ),
              SizedBox(height: 20.h),
              _PhoneTextField(
                phoneController: phoneController,
              ),
              SizedBox(height: 30.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 0.18.sw),
                child: CustomElevated(
                  text: "LOGIN",
                  press: () {
                    if (formKey.currentState!.validate()) {
                      MagicRouter.navigateTo(
                        page: OtpView(
                          phone: phoneController.text,
                        ),
                      );
                    }
                  },
                  btnColor: ColorManager.mainColor,
                ),
              ),
              SizedBox(height: 50.h),
            ],
          ),
        ),
      ),
    );
  }
}

class _PhoneTextField extends StatelessWidget {
  const _PhoneTextField({required this.phoneController});

  final TextEditingController phoneController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: "Mobile Number",
          color: ColorManager.grey,
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
        ),
        SizedBox(height: 5.h),
        CustomTextFormField(
          controller: phoneController,
          keyboardType: TextInputType.phone,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          hint: "Enter Your Mobile Number",
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "Please Enter Your Mobile Number !";
            }
            return null;
          },
          isLastInput: true,
        ),
      ],
    );
  }
}
