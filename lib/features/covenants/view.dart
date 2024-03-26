import 'package:cmp_app/core/helpers/navigator.dart';
import 'package:cmp_app/core/theming/assets.dart';
import 'package:cmp_app/core/theming/colors.dart';
import 'package:cmp_app/core/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'widgets/covenants_item.dart';

class CovenantsView extends StatelessWidget {
  const CovenantsView({super.key});

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
                  text: "Covenants",
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
      body: ListView(
        children: const [
          CovenantsItem(
            image: AssetsStrings.laptop,
            title: "laptop",
            subTitle:
                "The covenant belongs to a specific company and it is a laptop for a period of two weeks it was delivered today at one o'clock in the morning",
            address: "Tanta Stadium Street next to the National Bank ",
          ),
          CovenantsItem(
            image: AssetsStrings.money,
            title: "Money",
            subTitle:
                "A sum of money was received from one of our companies at 5 pm and the amount is estimated at try 100 thousand Egyptian pounds",
            address: "Tanta Stadium Street next to the National Bank ",
          ),
          CovenantsItem(
            image: AssetsStrings.paper,
            title: "paper",
            subTitle:
                "A total of printing paper was received from one of our subsidiaries at twelve o'clock after midnight",
            address: "Tanta Stadium Street next to the National Bank ",
          ),
        ],
      ),
    );
  }
}
