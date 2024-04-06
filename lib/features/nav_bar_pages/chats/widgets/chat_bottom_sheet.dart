import 'package:cmp_app/core/theming/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatBottomSheet extends StatelessWidget {
  const ChatBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final TextEditingController msgController = TextEditingController();
    return Container(
      color: ColorManager.white,
      child: Padding(
        padding: EdgeInsets.all(0.042.sw),
        child: Row(
          children: [
            Flexible(
              child: SizedBox(
                child: TextFormField(
                  controller: msgController,
                  textInputAction: TextInputAction.done,
                  maxLines: null,
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: ColorManager.white,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                      ),
                  onFieldSubmitted: (value) {
                    msgController.text = "";
                  },
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: ColorManager.mainColor,
                    hintText: "Message...",
                    hintStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
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
                  msgController.text = "";
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
    );
  }
}
