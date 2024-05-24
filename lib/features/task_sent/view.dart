import 'package:cmp_app/core/theming/assets.dart';
import 'package:cmp_app/core/theming/colors.dart';
import 'package:cmp_app/core/widgets/custom_elevated.dart';
import 'package:cmp_app/core/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TaskSentView extends StatelessWidget {
  const TaskSentView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: ColorManager.white,
      ),
      backgroundColor: ColorManager.white,
      body: SizedBox(
        height: 1.sh,
        width: 1.sw,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                AssetsStrings.taskSentImage,
                height: 100.h,
              ),
              SizedBox(height: 20.h),
              CustomText(
                text: "Task sent",
                color: ColorManager.mainColor,
                fontSize: 32.sp,
                fontWeight: FontWeight.w700,
              ),
              // SizedBox(height: 20.h),
              // CustomText(
              //   text:
              //       "Mail sent to Nadanour221@gamil.com. please verify your mail. once you verified . the account will be linked",
              //   color: ColorManager.black5,
              //   fontSize: 20.sp,
              //   fontWeight: FontWeight.w400,
              //   maxLines: 20,
              //   textAlign: TextAlign.center,
              // ),
              // SizedBox(height: 20.h),
              // Padding(
              //   padding: EdgeInsets.symmetric(horizontal: 40.w),
              //   child: CustomElevated(
              //     text: "Ok. Will check mail",
              //     press: () {},
              //     btnColor: ColorManager.mainColor,
              //     borderRadius: 18.r,
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
