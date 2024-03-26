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
      body: Column(
        children: [
          Container(
            height: 180.h,
            padding: EdgeInsets.only(
              top: 50.h,
              left: 0.02.sw,
              right: 0.02.sw,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(24.r),
              ),
              color: ColorManager.mainColor,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: () {
                    MagicRouter.navigatePop();
                  },
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: ColorManager.white,
                    size: 22.sp,
                  ),
                ),
                SizedBox(width: 80.w),
                CircleAvatar(
                  radius: 50.r,
                  child: ClipOval(
                    child: Image.asset(image),
                  ),
                ),
              ],
            ),
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                top: 0,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(16.r),
                    ),
                    color: ColorManager.white,
                    border: Border.all(color: ColorManager.grey3),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10.w,
                      vertical: 5.h,
                    ),
                    child: CustomText(
                      text: name,
                      color: ColorManager.mainColor,
                      fontSize: 22.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 20.w,
                  vertical: 10.h,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                      radius: 22.r,
                      backgroundColor: ColorManager.mainColor,
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.call,
                          color: ColorManager.white,
                          size: 25.sp,
                        ),
                      ),
                    ),
                    CircleAvatar(
                      radius: 22.r,
                      backgroundColor: ColorManager.mainColor,
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.videocam,
                          color: ColorManager.white,
                          size: 25.sp,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Expanded(
            child: ListView(
              children: const [
                MainChatBubble(
                  isFriend: true,
                  message: "Hi Nada",
                  time: "2:45 am",
                ),
                MainChatBubble(
                  message: "Hi",
                  time: "2:45 am",
                ),
                MainChatBubble(
                  isFriend: true,
                  message: "What's up with work? Are you done?",
                  time: "2:45 am",
                ),
                MainChatBubble(
                  message: "No, it's not over yet. You have to come.",
                  time: "2:45 am",
                ),
              ],
            ),
          ),
        ],
      ),
      bottomSheet: ChatBottomSheet(),
    );
  }
}
