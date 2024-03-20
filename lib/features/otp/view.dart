import 'package:cmp_app/core/helpers/navigator.dart';
import 'package:cmp_app/core/theming/assets.dart';
import 'package:cmp_app/core/theming/colors.dart';
import 'package:cmp_app/core/widgets/custom_elevated.dart';
import 'package:cmp_app/core/widgets/custom_text.dart';
import 'package:cmp_app/core/widgets/snack_bar.dart';
import 'package:cmp_app/features/otp/widgets/pinput.dart';
import 'package:cmp_app/features/reset_password/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OtpView extends StatelessWidget {
  const OtpView({super.key, required this.phone});

  final String phone;

  @override
  Widget build(BuildContext context) {
    final TextEditingController otpController = TextEditingController();

    return Scaffold(
      backgroundColor: ColorManager.white,
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: Image.asset(
              AssetsStrings.otpImage,
              height: 180.h,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 0.28.sh),
                  CustomText(
                    text: "Verification Code",
                    color: ColorManager.black3,
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w700,
                  ),
                  SizedBox(height: 5.h),
                  CustomText(
                    text: "Please type the verification code \n to $phone",
                    color: ColorManager.black3,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w700,
                    maxLines: 5,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 10.h),
                  PinPutWidget(
                    controller: otpController,
                  ),
                  SizedBox(height: 0.3.sh),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 0.18.sw),
                    child: CustomElevated(
                      text: "LOGIN",
                      press: () {
                        if (otpController.text.length != 4) {
                          showMessage(
                            message: "Please Enter the code !",
                            color: ColorManager.redPrimary,
                          );
                        } else if (otpController.text != "0000") {
                          showMessage(
                            message: "Wrong OTP Code !",
                            color: ColorManager.redPrimary,
                          );
                        } else {
                          MagicRouter.navigateTo(
                              page: const ResetPasswordView());
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
        ],
      ),
    );
  }
}
