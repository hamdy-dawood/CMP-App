import 'package:cmp_app/core/theming/colors.dart';
import 'package:cmp_app/core/widgets/custom_text.dart';
import 'package:cmp_app/core/widgets/search_text_field.dart';
import 'package:cmp_app/features/nav_bar_pages/chat/cubit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'components/chat_item.dart';

class ChatsView extends StatelessWidget {
  const ChatsView({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController searchController = TextEditingController();
    var chatCubit = context.read<ChatCubit>();
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
      body: StreamBuilder(
          stream: chatCubit.getUsersStream(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (snapshot.hasError) {
              return const Text('there is an error');
            }
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (BuildContext context, int index) {
                  final userData = snapshot.data![index];
                  if (userData['email'] !=
                      FirebaseAuth.instance.currentUser!.email) {
                    return ChatItem(
                      receiverUsername: userData['username'] ?? '',
                      receiverId: userData['uid'],
                      body: "I'm busy .",
                      index: index,
                      inHome: false,
                    );
                  } else {
                    return Container();
                  }
                },
              ),
            );
          }),
    );
  }
}
