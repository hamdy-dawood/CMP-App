import 'package:cmp_app/core/helpers/navigator.dart';
import 'package:cmp_app/core/theming/assets.dart';
import 'package:cmp_app/core/theming/colors.dart';
import 'package:cmp_app/core/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'widget/notification_item.dart';

class NotificationsView extends StatelessWidget {
  const NotificationsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(180.h),
        child: Stack(
          children: [
            Container(
              height: 180.h,
              padding: EdgeInsets.symmetric(horizontal: 0.02.sw),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(24.r),
                ),
                color: ColorManager.mainColor,
              ),
              child: AppBar(
                elevation: 0,
                backgroundColor: Colors.transparent,
                title: CustomText(
                  text: "Notification",
                  color: ColorManager.white,
                  fontSize: 25.sp,
                  fontWeight: FontWeight.w700,
                ),
                centerTitle: true,
                leading: IconButton(
                  onPressed: () {
                    MagicRouter.navigatePop();
                  },
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: ColorManager.white,
                    size: 22.sp,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: SizedBox(
        width: 1.sw,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 10.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    text: "Notification",
                    color: ColorManager.mainColor,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                  ),
                  TextButton(
                    onPressed: () {},
                    child: CustomText(
                      text: "Delete All",
                      color: ColorManager.grey6,
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
            const NotificationItem(
              icon: AssetsStrings.entryDate,
              title: "Create Landing page",
              subTitle: "2h ago / sep - 06:00",
            ),
            const NotificationItem(
              icon: AssetsStrings.entryDate,
              title: "Make logo",
              subTitle: "2h ago / sep - 06:00",
            ),
          ],
        ),
      ),
    );
  }
}
