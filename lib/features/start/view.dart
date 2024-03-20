import 'package:cmp_app/core/helpers/navigator.dart';
import 'package:cmp_app/core/theming/assets.dart';
import 'package:cmp_app/core/theming/colors.dart';
import 'package:cmp_app/core/widgets/custom_elevated.dart';
import 'package:cmp_app/core/widgets/custom_text.dart';
import 'package:cmp_app/core/widgets/outline_container.dart';
import 'package:cmp_app/features/login/view.dart';
import 'package:cmp_app/features/register/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StartView extends StatelessWidget {
  const StartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20.h),
              child: Image.asset(
                AssetsStrings.startImage,
                height: 350.h,
              ),
            ),
            CustomText(
              text: "Are you ready to start \nyour business journey?",
              color: ColorManager.black,
              fontSize: 24.sp,
              fontWeight: FontWeight.w700,
              maxLines: 4,
            ),
            SizedBox(height: 15.h),
            CustomText(
              text: "Every day closer to the goal",
              color: ColorManager.grey,
              fontSize: 15.sp,
              fontWeight: FontWeight.w700,
            ),
            SizedBox(height: 20.h),
            CustomElevated(
              text: "Sign in",
              press: () {
                MagicRouter.navigateTo(page: const LoginView());
              },
              btnColor: ColorManager.mainColor,
            ),
            SizedBox(height: 10.h),
            OutlinedContainer(
              image: AssetsStrings.apple,
              text: "Continue with Apple",
              onPress: () {},
              borderBtnColor: ColorManager.black2,
              backgroundColor: ColorManager.white,
            ),
            SizedBox(height: 10.h),
            OutlinedContainer(
              image: AssetsStrings.google,
              text: "Continue with Google",
              onPress: () {},
              borderBtnColor: ColorManager.black2,
              backgroundColor: ColorManager.white,
            ),
            SizedBox(height: 20.h),
            Center(
              child: InkWell(
                onTap: () {
                  MagicRouter.navigateTo(page: const RegisterView());
                },
                child: CustomText(
                  text: "Create Account",
                  color: ColorManager.grey,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
