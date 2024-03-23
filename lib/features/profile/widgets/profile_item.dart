import 'package:cmp_app/core/theming/colors.dart';
import 'package:cmp_app/core/widgets/custom_text.dart';
import 'package:cmp_app/core/widgets/svg_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileItem extends StatelessWidget {
  const ProfileItem({
    super.key,
    required this.title,
    required this.subTitle,
    required this.icon,
  });
  final String title, subTitle, icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20.h, right: 15.w, left: 15.w),
      padding: EdgeInsets.only(top: 10.h, bottom: 20.h),
      width: 0.8.sw,
      decoration: BoxDecoration(
        border: Border.all(color: ColorManager.grey4, width: 0.5),
        borderRadius: BorderRadius.circular(10.r),
        color: ColorManager.white,
        boxShadow: [
          BoxShadow(
            color: ColorManager.grey.withOpacity(0.5),
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgIcon(
              icon: icon,
              color: ColorManager.mainColor,
              height: 25.h,
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
            const Spacer(),
            // SvgIcon(
            //   icon: AssetsStrings.delete,
            //   color: ColorManager.purple,
            //   height: 28.h,
            // ),
          ],
        ),
      ),
    );
  }
}
