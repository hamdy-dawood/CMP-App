import 'package:cmp_app/core/helpers/navigator.dart';
import 'package:cmp_app/core/theming/colors.dart';
import 'package:cmp_app/core/widgets/custom_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'components/chat_bubble.dart';
import 'cubit.dart';

class ChatPage extends StatelessWidget {
  ChatPage({
    super.key,
    required this.image,
    required this.receiverUsername,
    required this.receiverId,
  });
  final String image, receiverUsername, receiverId;
  final _controller = ScrollController();
  final TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var chatCubit = context.read<ChatCubit>();
    String senderId = FirebaseAuth.instance.currentUser!.uid;
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
                text: receiverUsername,
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
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder(
                stream: chatCubit.getMessages(
                  userId: senderId,
                  otherUserId: receiverId,
                ),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return const Text('there is an error');
                  }
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  return ListView(
                    controller: _controller,
                    children: snapshot.data!.docs.map((doc) {
                      Map<String, dynamic> data =
                          doc.data() as Map<String, dynamic>;
                      return MainChatBubble(
                        isFriend: data["senderId"] != senderId,
                        message: data["message"],
                      );
                    }).toList(),
                  );
                }),
          ),
          Container(
            color: ColorManager.white,
            child: Padding(
              padding: EdgeInsets.all(0.042.sw),
              child: Row(
                children: [
                  Flexible(
                    child: SizedBox(
                      child: TextFormField(
                        controller: textController,
                        textInputAction: TextInputAction.done,
                        maxLines: null,
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              color: ColorManager.white,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w400,
                            ),
                        onFieldSubmitted: (value) async {
                          if (textController.text.isNotEmpty) {
                            await chatCubit.sendMessage(
                              message: textController.text,
                              receiverId: receiverId,
                            );
                            textController.clear();
                            _controller.animateTo(
                              0,
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeIn,
                            );
                          }
                        },
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: ColorManager.mainColor,
                          hintText: "Message...",
                          hintStyle:
                              Theme.of(context).textTheme.bodySmall!.copyWith(
                                    color: ColorManager.white,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                          contentPadding: EdgeInsets.all(15.h),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50.r),
                            borderSide: BorderSide(
                              color: ColorManager.mainColor,
                            ),
                          ),
                          focusColor: ColorManager.mainColor,
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50.r),
                            borderSide: BorderSide(
                              color: ColorManager.mainColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10.w),
                  CircleAvatar(
                    radius: 22.r,
                    backgroundColor: ColorManager.mainColor,
                    child: IconButton(
                      onPressed: () async {
                        if (textController.text.isNotEmpty) {
                          await chatCubit.sendMessage(
                            message: textController.text,
                            receiverId: receiverId,
                          );
                          textController.clear();
                          _controller.animateTo(
                            0,
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeIn,
                          );
                        }
                      },
                      icon: Icon(
                        Icons.send_rounded,
                        color: ColorManager.white,
                        size: 20.sp,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
