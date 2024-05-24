import 'package:cmp_app/core/helpers/navigator.dart';
import 'package:cmp_app/core/theming/assets.dart';
import 'package:cmp_app/core/theming/colors.dart';
import 'package:cmp_app/core/widgets/custom_text.dart';
import 'package:cmp_app/core/widgets/svg_icons.dart';
import 'package:cmp_app/features/nav_bar_pages/tasks/model.dart';
import 'package:cmp_app/features/task_details/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class TaskItemTasks extends StatelessWidget {
  final Task task;
  const TaskItemTasks({super.key, required this.task,});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        MagicRouter.navigateTo(
          page: TaskDetails(taskId: task.taskId??'0',),
        );
      },
      child: Padding(
        padding: EdgeInsets.only(bottom: 15.h),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomText(
                  text: task.fromTime??'',
                  color: ColorManager.black,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                ),
                SizedBox(height: 15.h),
                CustomText(
                  text: task.toTime??'',
                  color: ColorManager.black,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                ),
              ],
            ),
            SizedBox(width: 10.w),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(
                  top: 15.h,
                  bottom: 12.h,
                  left: 10.h,
                  right: 10.h,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.r),
                  color: ColorManager.mainColor.withOpacity(0.1),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: task.title??'',
                      color: ColorManager.black,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w400,
                    ),
                    SizedBox(height: 10.h),
                    Row(
                      children: [
                        SvgIcon(
                          icon: AssetsStrings.time,
                          color: ColorManager.mainColor,
                          height: 12.h,
                        ),
                        SizedBox(width: 5.w),
                        CustomText(
                          text: task.day??'',
                          color: ColorManager.black,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ],
                    ),
                    SizedBox(height: 20.h),
                    LinearPercentIndicator(
                      animation: true,
                      lineHeight: 15,
                      animationDuration: 1000,
                      percent: (task.subTaskStatistics?.completionPercentage??0)/100,
                      center: FittedBox(child: Text("${task.subTaskStatistics?.completionPercentage??0} %",style: TextStyle(color: (task.subTaskStatistics?.completionPercentage??0) > 50 ? ColorManager.white : ColorManager.black),)),
                      barRadius: Radius.circular(20.r),
                      progressColor: ColorManager.mainColor,
                      backgroundColor: ColorManager.white,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
