import 'package:cmp_app/core/helpers/navigator.dart';
import 'package:cmp_app/core/theming/colors.dart';
import 'package:cmp_app/core/widgets/custom_text.dart';
import 'package:cmp_app/core/widgets/svg_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String text;
  final Color color;

  const CustomAppBar({Key? key, required this.text, required this.color})
      : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(50.h);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: color,
      leading: IconButton(
        onPressed: () {
          MagicRouter.navigatePop();
        },
        icon: SvgIcon(
          icon: "AssetsStrings.back",
          height: 18.76.h,
          color: Theme.of(context).indicatorColor,
        ),
      ),
      title: CustomText(
        text: text,
        color: ColorManager.grey,
        fontSize: 16.sp,
        fontWeight: FontWeight.w500,
      ),
      centerTitle: true,
    );
  }
}
