import 'package:cmp_app/core/theming/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';

class PinPutWidget extends StatelessWidget {
  final TextEditingController controller;

  const PinPutWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Pinput(
      keyboardType: TextInputType.number,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      length: 4,
      controller: controller,
      defaultPinTheme: _buildPinTheme(context),
      focusedPinTheme: _buildPinTheme(context, focused: true),
      errorPinTheme: _buildPinTheme(context, hasError: true),
    );
  }

  PinTheme _buildPinTheme(BuildContext context,
      {bool focused = false, bool hasError = false}) {
    return PinTheme(
      height: 50.h,
      width: 50.h,
      textStyle: TextStyle(
        color: ColorManager.black,
        fontSize: 24.sp,
        fontWeight: FontWeight.w800,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18.r),
        color: hasError
            ? ColorManager.redPrimary
            : focused
                ? ColorManager.mainColor
                : ColorManager.grey3,
      ),
    );
  }
}
