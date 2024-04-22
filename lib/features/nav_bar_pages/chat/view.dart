import 'package:cmp_app/core/helpers/cache_helper.dart';
import 'package:cmp_app/core/helpers/navigator.dart';
import 'package:cmp_app/core/theming/colors.dart';
import 'package:cmp_app/core/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'components/chat_bubble.dart';
import 'components/message_model.dart';
import 'cubit.dart';

class ChatPage extends StatelessWidget {
  ChatPage({super.key, required this.image, required this.name});
  final String image, name;

  static String id = 'ChatPage';
  final _controller = ScrollController();
  TextEditingController textController = TextEditingController();
  List<Message> messagesList = [];
  bool isSent = false;

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<ChatCubit>(context).getMessage();
    String email = CacheHelper.getName();

    return BlocConsumer<ChatCubit, ChatState>(
      listener: (context, state) {
        if (state is ChatSuccessState) {
          isSent = true;
          messagesList = state.messages;
        } else if (state is ChatFailureState) {
          isSent = false;
        }
      },
      builder: (context, state) {
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
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomText(
                        text: name,
                        color: ColorManager.white,
                        fontSize: 22.sp,
                        fontWeight: FontWeight.w700,
                      ),
                      CustomText(
                        text: "typing...",
                        color: ColorManager.white,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ],
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
                child: ListView.builder(
                    reverse: true,
                    controller: _controller,
                    itemCount: messagesList.length,
                    itemBuilder: (context, index) {
                      return MainChatBubble(
                        isFriend: messagesList[index].id != email,
                        message: messagesList[index].message,
                        time: messagesList[index].time,
                        // icon: isSent ? Icons.done : Icons.error,
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
                            style:
                                Theme.of(context).textTheme.bodySmall!.copyWith(
                                      color: ColorManager.white,
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w400,
                                    ),
                            onFieldSubmitted: (value) {
                              if (textController.text == "") {
                              } else {
                                BlocProvider.of<ChatCubit>(context).sendMessage(
                                    message: textController.text.toString(),
                                    email: email.toString());
                                textController.clear();
                                _controller.animateTo(0,
                                    duration: const Duration(milliseconds: 500),
                                    curve: Curves.easeIn);
                              }
                            },
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: ColorManager.mainColor,
                              hintText: "Message...",
                              hintStyle: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
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
                          onPressed: () {
                            if (textController.text == "") {
                            } else {
                              BlocProvider.of<ChatCubit>(context).sendMessage(
                                  message: textController.text.toString(),
                                  email: email.toString());
                              textController.clear();
                              _controller.animateTo(0,
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.easeIn);
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
      },
    );
  }
}
