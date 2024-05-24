import 'package:cmp_app/core/helpers/cache_helper.dart';
import 'package:cmp_app/core/helpers/navigator.dart';
import 'package:cmp_app/core/theming/assets.dart';
import 'package:cmp_app/core/theming/colors.dart';
import 'package:cmp_app/core/widgets/custom_text.dart';
import 'package:cmp_app/core/widgets/svg_icons.dart';
import 'package:cmp_app/features/nav_bar_pages/home/home_cubit.dart';
import 'package:cmp_app/features/nav_bar_pages/home/model.dart';
import 'package:cmp_app/features/notifications/view.dart';
import 'package:cmp_app/features/profile/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainAppBarView extends StatelessWidget {
  final UserData? userData;
  final double totalTarget;
  const MainAppBarView({super.key, required this.userData, required this.totalTarget});

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
                        text: userData?.name??'',
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
                    child: Container(
                      height: 50.h,
                      width: 50.h,
                      clipBehavior: Clip.antiAlias,
                      decoration: const BoxDecoration(
                        color: Colors.transparent,
                        shape: BoxShape.circle,
                      ),
                      child: (userData?.imageUrl??'').isNotEmpty
                          ? Image.network(
                              userData?.imageUrl??'',
                              fit: BoxFit.cover,
                            )
                          : Image.asset(
                              AssetsStrings.user,
                              fit: BoxFit.cover,
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
                        text: totalTarget.toString(),
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
              InkWell(
                onTap: () =>  BlocProvider.of<HomeCubit>(context).getHome(),
                child: SvgIcon(
                  icon: AssetsStrings.reload,
                  color: ColorManager.grey5,
                  height: 25.h,
                ),
              ),
            ],
          ),
          SizedBox(height: 40.h),
        ],
      ),
    );
  }
}
