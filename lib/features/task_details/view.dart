import 'package:cmp_app/core/theming/assets.dart';
import 'package:cmp_app/core/theming/colors.dart';
import 'package:cmp_app/core/widgets/app_bar.dart';
import 'package:cmp_app/core/widgets/custom_text.dart';
import 'package:cmp_app/features/nav_bar_pages/home/widgets/task_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TaskDetails extends StatelessWidget {
  const TaskDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      appBar: CustomAppBar(
        text: "Task Details",
        backgroundColor: ColorManager.white,
        leadingColor: ColorManager.mainColor,
        textColor: ColorManager.mainColor,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: ListView(
          children: [
            SizedBox(height: 20.h),
            CustomText(
              text: "User experience design",
              color: ColorManager.black,
              fontSize: 24.sp,
              fontWeight: FontWeight.w400,
            ),
            SizedBox(height: 20.h),
            CustomText(
              text: "Description",
              color: ColorManager.black,
              fontSize: 18.sp,
              fontWeight: FontWeight.w700,
            ),
            Text(
              "The user query is incomplete and it is unclear what the user is looking for. The web results contain two different definitions of description. According to the first definition, description means the act or method of describing, sort, kind, variety, or the act or process of describing.",
              style: TextStyle(
                color: ColorManager.grey4,
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: 30.h),
            CustomText(
              text: "Sub Task",
              color: ColorManager.black,
              fontSize: 16.sp,
              fontWeight: FontWeight.w700,
            ),
            SizedBox(height: 10.h),
            const TaskItem(
              image: AssetsStrings.task1Image,
              title: "Education app design",
              date: "18 Aug 2024",
            ),
            const TaskItem(
              image: AssetsStrings.task2Image,
              title: "Dashboard redesign",
              date: "18 Aug 2024",
            )
          ],
        ),
      ),
    );
  }
}
