import 'package:cmp_app/core/helpers/cache_helper.dart';
import 'package:cmp_app/core/helpers/navigator.dart';
import 'package:cmp_app/core/theming/assets.dart';
import 'package:cmp_app/core/theming/colors.dart';
import 'package:cmp_app/core/widgets/app_bar.dart';
import 'package:cmp_app/core/widgets/custom_text.dart';
import 'package:cmp_app/features/covenants/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'widgets/profile_item.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      appBar: CustomAppBar(
        text: "Profile",
        backgroundColor: ColorManager.mainColor,
        leadingColor: ColorManager.white,
        textColor: ColorManager.white,
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: 1.sw,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Image.asset(
                    AssetsStrings.profile,
                  ),
                  CircleAvatar(
                    radius: 55.r,
                    child: ClipOval(
                      child: Image.asset(AssetsStrings.user),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              CustomText(
                text: CacheHelper.getName(),
                color: ColorManager.black,
                fontSize: 24.sp,
                fontWeight: FontWeight.w700,
              ),
              CustomText(
                text: CacheHelper.getEmail(),
                color: ColorManager.grey4,
                fontSize: 16.sp,
                fontWeight: FontWeight.w700,
              ),
              SizedBox(height: 20.h),
              const ProfileItem(
                icon: AssetsStrings.entryDate,
                title: "Entry Date",
                subTitle: "1Mar 2024",
              ),
              const ProfileItem(
                icon: AssetsStrings.id,
                title: "ID",
                subTitle: "18526346286111",
              ),
              const ProfileItem(
                icon: AssetsStrings.phone,
                title: "Phone Number",
                subTitle: "01010254621",
              ),
              const ProfileItem(
                icon: AssetsStrings.ip,
                title: "IP",
                subTitle: "18526346286111",
              ),
              GestureDetector(
                onTap: () {
                  MagicRouter.navigateTo(page: const CovenantsView());
                },
                child: const ProfileItem(
                  icon: AssetsStrings.covenants,
                  title: "Covenants",
                  subTitle: "",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
