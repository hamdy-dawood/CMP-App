import 'package:cmp_app/core/theming/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BottomBarItem extends StatelessWidget {
  final String icon;
  final bool isSelected;
  final VoidCallback onPress;

  const BottomBarItem({
    super.key,
    required this.icon,
    this.isSelected = true,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: SvgPicture.asset(
        icon,
        height: 30,
        colorFilter: ColorFilter.mode(
          isSelected ? ColorManager.mainColor : ColorManager.grey,
          BlendMode.srcIn,
        ),
      ),
    );
  }
}
