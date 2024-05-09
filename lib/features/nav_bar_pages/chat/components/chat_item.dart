import 'package:cmp_app/core/helpers/navigator.dart';
import 'package:cmp_app/core/theming/colors.dart';
import 'package:cmp_app/core/widgets/custom_text.dart';
import 'package:cmp_app/features/nav_bar_pages/chat/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'chat_images_list.dart';

class ChatItem extends StatelessWidget {
  const ChatItem({
    super.key,
    required this.index,
    required this.receiverUsername,
    required this.body,
    required this.receiverId,
  });

  final int index;
  final String receiverUsername, body, receiverId;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        MagicRouter.navigateTo(
          page: ChatPage(
            image: chatImages[index],
            receiverUsername: receiverUsername,
            receiverId: receiverId,
          ),
        );
      },
      child: Padding(
        padding: EdgeInsets.only(top: 10.h),
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 30.r,
                  child: ClipOval(
                    child: Image.asset(chatImages[index]),
                  ),
                ),
                SizedBox(width: 15.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: receiverUsername,
                      color: ColorManager.black,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w700,
                    ),
                    SizedBox(height: 5.h),
                    CustomText(
                      text: body,
                      color: ColorManager.grey4,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ],
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.h),
              child: Divider(
                thickness: 1.h,
                color: ColorManager.grey4,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
