import 'package:cmp_app/core/theming/assets.dart';
import 'package:cmp_app/core/theming/colors.dart';
import 'package:cmp_app/core/widgets/custom_text.dart';
import 'package:cmp_app/core/widgets/svg_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TaskItem extends StatelessWidget {
  const TaskItem({
    super.key,
    required this.title,
    required this.date,
    required this.image,
  });
  final String title, date, image;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10.h, right: 15.w, left: 15.w),
      padding: EdgeInsets.only(top: 10.h, bottom: 20.h),
      width: 0.9.sw,
      decoration: BoxDecoration(
        border: Border.all(color: ColorManager.black, width: 0.5),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              image,
              height: 25.h,
            ),
            SizedBox(width: 20.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomText(
                  text: title,
                  color: ColorManager.black,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w400,
                ),
                CustomText(
                  text: date,
                  color: ColorManager.grey,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                ),
              ],
            ),
            const Spacer(),
            SvgIcon(
              icon: AssetsStrings.delete,
              color: ColorManager.purple,
              height: 28.h,
            ),
          ],
        ),
      ),
    );
  }
}
