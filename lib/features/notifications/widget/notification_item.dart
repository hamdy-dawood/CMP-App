import 'package:cmp_app/core/theming/assets.dart';
import 'package:cmp_app/core/theming/colors.dart';
import 'package:cmp_app/core/widgets/custom_text.dart';
import 'package:cmp_app/core/widgets/svg_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationItem extends StatelessWidget {
  const NotificationItem({
    super.key,
    required this.title,
    required this.subTitle,
    required this.icon,
  });
  final String title, subTitle, icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 15.w, left: 15.w),
      padding: EdgeInsets.only(top: 10.h, bottom: 20.h),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.all(5.w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6.r),
                    color: ColorManager.mainColor,
                  ),
                  child: SvgIcon(
                    icon: icon,
                    color: ColorManager.white,
                    height: 25.h,
                  ),
                ),
                SizedBox(width: 30.w),
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
                      text: subTitle,
                      color: ColorManager.grey,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ],
                ),
                // const Spacer(),
                // SvgIcon(
                //   icon: AssetsStrings.remove,
                //   color: ColorManager.grey3,
                //   height: 28.h,
                // ),
              ],
            ),
            SizedBox(height: 10.h),
            Divider(
              thickness: 1.h,
              color: ColorManager.grey4,
            ),
          ],
        ),
      ),
    );
  }
}
