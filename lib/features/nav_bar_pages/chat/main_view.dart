import 'package:cmp_app/core/theming/assets.dart';
import 'package:cmp_app/core/theming/colors.dart';
import 'package:cmp_app/core/widgets/custom_text.dart';
import 'package:cmp_app/core/widgets/search_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'components/chat_item.dart';

class ChatsView extends StatelessWidget {
  const ChatsView({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController searchController = TextEditingController();

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
                  text: "Chats",
                  color: ColorManager.white,
                  fontSize: 25.sp,
                  fontWeight: FontWeight.w700,
                ),
                centerTitle: true,
                leading: const SizedBox.shrink(),
              ),
            ),
            Positioned(
              bottom: 20.h,
              child: SizedBox(
                width: 1.sw,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 0.04.sw),
                  child: SearchTextField(
                    controller: searchController,
                    onFieldSubmitted: (value) {},
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: ListView(
          children: const [
            ChatItem(
              image: AssetsStrings.abdallah,
              name: "Abdallah Dawoood",
              body: "I'm busy .",
            ),
          ],
        ),
      ),
    );
  }
}
