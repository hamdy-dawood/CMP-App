import 'package:cmp_app/core/helpers/navigator.dart';
import 'package:cmp_app/core/theming/colors.dart';
import 'package:cmp_app/core/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String text;

  const CustomAppBar({super.key, required this.text});

  @override
  Size get preferredSize => Size.fromHeight(50.h);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: ColorManager.mainColor,
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
      title: CustomText(
        text: text,
        color: ColorManager.white,
        fontSize: 25.sp,
        fontWeight: FontWeight.w700,
      ),
      centerTitle: true,
    );
  }
}
