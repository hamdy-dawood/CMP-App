import 'package:cmp_app/core/theming/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainChatBubble extends StatelessWidget {
  const MainChatBubble({
    super.key,
    this.isFriend = false,
    required this.message,
    required this.time,
  });
  final bool isFriend;
  final String message;
  final String time;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isFriend ? Alignment.centerLeft : Alignment.centerRight,
      child: Container(
        padding: EdgeInsets.all(8.h),
        margin: EdgeInsets.only(
          right: 0.022.sw,
          left: 0.022.sw,
          bottom: 0.0295.sh,
        ),
        decoration: BoxDecoration(
          borderRadius: isFriend
              ? BorderRadius.only(
                  topLeft: Radius.circular(8.r),
                  bottomLeft: Radius.circular(8.r),
                  bottomRight: Radius.circular(8.r),
                )
              : BorderRadius.only(
                  topRight: Radius.circular(8.r),
                  bottomRight: Radius.circular(8.r),
                  bottomLeft: Radius.circular(8.r),
                ),
          color: isFriend ? ColorManager.grey7 : ColorManager.mainColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              message,
              style: TextStyle(
                color: ColorManager.white,
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: 5.h),
            Text(
              time,
              style: TextStyle(
                color: ColorManager.white,
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
