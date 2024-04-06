import 'package:cmp_app/core/helpers/navigator.dart';
import 'package:cmp_app/core/theming/colors.dart';
import 'package:cmp_app/core/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'widgets/chat_bottom_sheet.dart';
import 'widgets/chat_bubble.dart';

class ChatDetails extends StatelessWidget {
  const ChatDetails({
    super.key,
    required this.image,
    required this.name,
  });

  final String image, name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: ColorManager.white,
        toolbarHeight: 100.h,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            color: ColorManager.mainColor,
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(20.r),
            ),
          ),
        ),
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
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomText(
                text: name,
                color: ColorManager.white,
                fontSize: 22.sp,
                fontWeight: FontWeight.w700,
              ),
              SizedBox(width: 10.w),
              CircleAvatar(
                radius: 30.r,
                child: ClipOval(
                  child: Image.asset(image),
                ),
              ),
              SizedBox(width: 10.w),
            ],
          )
        ],
      ),
      body: ListView(
        children: [
          SizedBox(height: 30.h),
          const MainChatBubble(
            isFriend: true,
            message: "Hi Nada",
            time: "2:45 am",
          ),
          const MainChatBubble(
            message: "Hi",
            time: "2:45 am",
          ),
          const MainChatBubble(
            isFriend: true,
            message: "What's up with work? Are you done?",
            time: "2:45 am",
          ),
          const MainChatBubble(
            message: "No, it's not over yet. You have to come.",
            time: "2:45 am",
          ),
        ],
      ),
      bottomSheet: const ChatBottomSheet(),
    );
  }
}
