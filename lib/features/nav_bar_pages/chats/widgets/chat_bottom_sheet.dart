import 'package:cmp_app/core/theming/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatBottomSheet extends StatelessWidget {
  const ChatBottomSheet({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorManager.white,
      child: Padding(
        padding: EdgeInsets.all(0.042.sw),
        child: Row(
          children: [
            Flexible(
              child: SizedBox(
                child: TextFormField(
                  textInputAction: TextInputAction.newline,
                  maxLines: null,
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: ColorManager.black,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                      ),
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
                onPressed: () {},
                icon: Icon(
                  Icons.mic,
                  color: ColorManager.white,
                  size: 25.sp,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
