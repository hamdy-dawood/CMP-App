import 'package:cmp_app/core/helpers/navigator.dart';
import 'package:cmp_app/core/theming/colors.dart';
import 'package:cmp_app/core/widgets/custom_elevated.dart';
import 'package:cmp_app/core/widgets/custom_text.dart';
import 'package:cmp_app/features/bottom_nav_bar/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/percent_indicator.dart';

class PercentContainer extends StatelessWidget {
  const PercentContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 0.9.sw,
      decoration: BoxDecoration(
        color: ColorManager.black4,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Padding(
        padding: EdgeInsets.all(20.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: "Your daily task\nalmost done",
                  color: ColorManager.white,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w400,
                  maxLines: 5,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 10.h),
                CustomElevated(
                  press: () {
                    MagicRouter.navigateTo(
                      page: const NavBarView(initialIndex: 1),
                    );
                  },
                  text: 'View task',
                  btnColor: ColorManager.mainColor,
                  textColor: ColorManager.white,
                  borderRadius: 12.r,
                  wSize: 0.3,
                  hSize: 40,
                ),
              ],
            ),
            const Spacer(),
            CircularPercentIndicator(
              radius: 50.r,
              lineWidth: 8.w,
              animation: true,
              percent: 0.95,
              center: Text(
                "95%",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 20.sp,
                  color: ColorManager.white,
                ),
              ),
              circularStrokeCap: CircularStrokeCap.butt,
              progressColor: ColorManager.mainColor,
              backgroundColor: ColorManager.black4,
            ),
            SizedBox(width: 10.w),
          ],
        ),
      ),
    );
  }
}
