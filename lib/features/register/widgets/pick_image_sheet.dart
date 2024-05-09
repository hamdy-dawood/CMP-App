import 'package:cmp_app/core/theming/assets.dart';
import 'package:cmp_app/core/theming/colors.dart';
import 'package:cmp_app/core/widgets/custom_text.dart';
import 'package:cmp_app/core/widgets/svg_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PickImageWidget extends StatelessWidget {
  const PickImageWidget({
    super.key,
    required this.cubit,
    required this.child,
    required this.onTapOne,
    required this.onTapTwo,
    required this.title,
  });
  final String title;
  final cubit;
  final Widget child;
  final VoidCallback onTapOne;
  final VoidCallback onTapTwo;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) => CustomAlert(
            mainTitle: title,
            title1: "choose_camera",
            title2: "choose_galley",
            image1: AssetsStrings.cameraAdd,
            image2: AssetsStrings.galleyAdd,
            onTapOne: onTapOne,
            onTapTwo: onTapTwo,
            iconColor: ColorManager.white,
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
    required this.mainTitle,
    required this.title1,
    required this.title2,
    required this.image1,
    required this.image2,
    required this.onTapOne,
    required this.onTapTwo,
    required this.iconColor,
  });
  final String mainTitle, title1, title2, image1, image2;
  final VoidCallback onTapOne;
  final VoidCallback onTapTwo;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Theme.of(context).cardColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.r),
      ),
      contentPadding: EdgeInsets.only(top: 20.h, bottom: 15.h),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomText(
            text: mainTitle,
            color: ColorManager.grey,
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
          ),
          Padding(
            padding: EdgeInsets.only(top: 15.h, bottom: 10.h),
            child: Divider(
              thickness: 1.5.h,
              color: Theme.of(context).dividerColor,
            ),
          ),
          CustomContainerForAlert(
            icon: image1,
            title: title1,
            onTap: onTapOne,
            iconColor: iconColor,
          ),
          SizedBox(height: 10.h),
          CustomContainerForAlert(
            icon: image2,
            title: title2,
            onTap: onTapTwo,
            iconColor: iconColor,
          ),
        ],
      ),
    );
  }
}

class CustomContainerForAlert extends StatelessWidget {
  const CustomContainerForAlert({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
    required this.iconColor,
  });
  final String title, icon;
  final VoidCallback onTap;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 15.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          color: ColorManager.dividersLight,
        ),
        child: SizedBox(
          height: 60.h,
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.w),
                child: SvgIcon(
                  icon: icon,
                  height: 24.h,
                  color: iconColor,
                ),
              ),
              Expanded(
                child: CustomText(
                  text: title,
                  color: ColorManager.grey,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
