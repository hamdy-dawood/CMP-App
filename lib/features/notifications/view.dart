import 'package:cmp_app/core/theming/assets.dart';
import 'package:cmp_app/core/theming/colors.dart';
import 'package:cmp_app/core/widgets/app_bar.dart';
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
      appBar: const CustomAppBar(text: "Notification"),
      body: SizedBox(
        width: 1.sw,
        child: Column(
          children: [
            Container(
              height: 100.h,
              width: 1.sw,
              decoration: BoxDecoration(
                color: ColorManager.mainColor,
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(20.r),
                ),
              ),
            ),
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
