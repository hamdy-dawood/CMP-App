import 'package:cmp_app/core/theming/assets.dart';
import 'package:cmp_app/core/theming/colors.dart';
import 'package:cmp_app/core/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TargetContainer extends StatelessWidget {
  final String todayTarget;
  final String weeklyTarget;
  const TargetContainer({super.key, required this.todayTarget, required this.weeklyTarget});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.h,
      margin: EdgeInsets.symmetric(horizontal: 0.1.sw),
      decoration: BoxDecoration(
        color: ColorManager.white,
        borderRadius: BorderRadius.circular(8.r),
        boxShadow: [
          BoxShadow(
            color: ColorManager.grey.withOpacity(0.5),
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _CustomTargetColumn(
            image: AssetsStrings.todayTargetImage,
            title: "Today Target",
            price: "$todayTarget\$",
          ),
          Container(
            width: 2.w,
            color: ColorManager.grey4,
            margin: EdgeInsets.symmetric(
              horizontal: 15.w,
              vertical: 5.h,
            ),
          ),
          _CustomTargetColumn(
            image: AssetsStrings.weeklyTargetImage,
            title: "Weekly Target",
            price: "$weeklyTarget\$",
          ),
        ],
      ),
    );
  }
}

class _CustomTargetColumn extends StatelessWidget {
  const _CustomTargetColumn({
    required this.image,
    required this.title,
    required this.price,
  });

  final String image, title, price;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: [
            Image.asset(
              image,
              height: 20.h,
            ),
            SizedBox(width: 5.w),
            CustomText(
              text: title,
              color: ColorManager.mainColor,
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
            ),
          ],
        ),
        SizedBox(height: 5.h),
        CustomText(
          text: price,
          color: ColorManager.black,
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
        ),
      ],
    );
  }
}
