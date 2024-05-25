import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'custom_text.dart';

class CustomElevated extends StatelessWidget {
  final String text;
  final Color textColor, btnColor;
  final double hSize, wSize, fontSize, borderRadius;
  final VoidCallback press;
  final FontWeight fontWeight;

  const CustomElevated({
    super.key,
    required this.text,
    required this.press,
    this.textColor = Colors.white,
    required this.btnColor,
    this.hSize = 55,
    this.wSize = 1,
    this.fontSize = 22,
    this.borderRadius = 15,
    this.fontWeight = FontWeight.w500,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: press,
      style: ElevatedButton.styleFrom(
        backgroundColor: btnColor,
        fixedSize: Size(wSize.sw, hSize.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius.r),
        ),
      ),
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: CustomText(
          text: text,
          color: textColor,
          fontSize: fontSize.sp,
          fontWeight: fontWeight,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
