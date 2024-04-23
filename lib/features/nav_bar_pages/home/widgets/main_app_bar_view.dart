import 'package:cmp_app/core/helpers/cache_helper.dart';
import 'package:cmp_app/core/helpers/navigator.dart';
import 'package:cmp_app/core/theming/assets.dart';
import 'package:cmp_app/core/theming/colors.dart';
import 'package:cmp_app/core/widgets/custom_text.dart';
import 'package:cmp_app/core/widgets/svg_icons.dart';
import 'package:cmp_app/features/notifications/view.dart';
import 'package:cmp_app/features/profile/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainAppBarView extends StatelessWidget {
  const MainAppBarView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        children: [
          SizedBox(height: 45.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Row(
                  children: [
                    CustomText(
                      text: "Hi, ",
                      color: ColorManager.white,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w400,
                    ),
                    Expanded(
                      child: CustomText(
                        text: "${CacheHelper.getName()} !",
                        color: ColorManager.white,
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      MagicRouter.navigateTo(page: const NotificationsView());
                    },
                    child: SvgIcon(
                      icon: AssetsStrings.notify,
                      color: ColorManager.white,
                      height: 25.h,
                    ),
                  ),
                  SizedBox(width: 15.w),
                  GestureDetector(
                    onTap: () {
                      MagicRouter.navigateTo(page: const ProfileView());
                    },
                    child: CircleAvatar(
                      radius: 22.r,
                      child: ClipOval(
                        child: Image.asset(AssetsStrings.user),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Divider(
            thickness: 1.h,
            color: ColorManager.white,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SvgIcon(
                    icon: AssetsStrings.eye,
                    color: ColorManager.white,
                    height: 25.h,
                  ),
                  SizedBox(width: 8.w),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      CustomText(
                        text: "8 180.08",
                        color: ColorManager.white,
                        fontSize: 28.sp,
                        fontWeight: FontWeight.w700,
                      ),
                      SizedBox(width: 8.w),
                      CustomText(
                        text: "Target",
                        color: ColorManager.white,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ],
                  ),
                ],
              ),
              SvgIcon(
                icon: AssetsStrings.reload,
                color: ColorManager.grey5,
                height: 25.h,
              ),
            ],
          ),
          SizedBox(height: 40.h),
        ],
      ),
    );
  }
}
