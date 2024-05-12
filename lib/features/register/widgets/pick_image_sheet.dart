import 'package:cmp_app/core/theming/assets.dart';
import 'package:cmp_app/core/theming/colors.dart';
import 'package:cmp_app/core/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PickImageWidget extends StatelessWidget {
  const PickImageWidget({
    super.key,
    required this.cubit,
    required this.child,
    required this.onTapOne,
    required this.onTapTwo,
  });

  final cubit;
  final Widget child;
  final VoidCallback onTapOne;
  final VoidCallback onTapTwo;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          backgroundColor: ColorManager.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(15.r),
              topLeft: Radius.circular(15.r),
            ),
          ),
          builder: (context) => Container(
            color: ColorManager.white,
            margin: EdgeInsets.all(30.h),
            child: CustomAlert(
              title1: "Camera",
              title2: "Gallery",
              image1: AssetsStrings.cameraAdd,
              image2: AssetsStrings.galleyAdd,
              onTapOne: onTapOne,
              onTapTwo: onTapTwo,
            ),
          ),
        );
      },
      child: child,
    );
  }
}

class CustomAlert extends StatelessWidget {
  const CustomAlert({
    super.key,
    required this.title1,
    required this.title2,
    required this.image1,
    required this.image2,
    required this.onTapOne,
    required this.onTapTwo,
  });

  final String title1, title2, image1, image2;
  final VoidCallback onTapOne;
  final VoidCallback onTapTwo;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomContainerForAlert(
          icon: image1,
          title: title1,
          onTap: onTapOne,
        ),
        SizedBox(width: 80.h),
        CustomContainerForAlert(
          icon: image2,
          title: title2,
          onTap: onTapTwo,
        ),
      ],
    );
  }
}

class CustomContainerForAlert extends StatelessWidget {
  const CustomContainerForAlert({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
  });

  final String title, icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            icon,
            height: 70.h,
          ),
          SizedBox(height: 10.h),
          CustomText(
            text: title,
            color: ColorManager.grey,
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
          ),
        ],
      ),
    );
  }
}
