import 'package:cmp_app/core/theming/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({
    Key? key,
    this.onTap,
    this.readOnly = false,
    this.autofocus = false,
    this.controller,
    this.onFieldSubmitted,
    this.onChanged,
  }) : super(key: key);

  final VoidCallback? onTap;
  final bool readOnly;
  final bool autofocus;
  final TextEditingController? controller;
  final Function(String)? onFieldSubmitted;
  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    final FocusNode focusNode = FocusNode();

    return GestureDetector(
      onTap: () {
        focusNode.unfocus();
      },
      child: SizedBox(
        height: 45.h,
        width: 1.sw,
        child: TextFormField(
          controller: controller,
          focusNode: focusNode,
          onTap: onTap,
          readOnly: readOnly,
          autofocus: autofocus,
          onFieldSubmitted: (value) {
            focusNode.unfocus();
            if (onFieldSubmitted != null &&
                controller!.text.trim().isNotEmpty) {
              onFieldSubmitted!(value);
            }
          },
          onChanged: onChanged,
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
                color: ColorManager.grey,
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
              ),
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.done,
          decoration: InputDecoration(
            filled: true,
            fillColor: Theme.of(context).cardColor,
            hintText: "Search",
            hintStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: ColorManager.grey,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                ),
            contentPadding: EdgeInsets.only(right: 5.w, left: 5.w),
            prefixIcon: Padding(
              padding: EdgeInsets.all(0.015.sh),
              child: Icon(
                Icons.search,
                color: ColorManager.black,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: BorderSide(
                width: 0.002.sh,
                color: Theme.of(context).cardColor,
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: BorderSide(
                width: 0.002.sh,
                color: Theme.of(context).cardColor,
              ),
            ),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 0.002.sh,
                  color: Theme.of(context).cardColor,
                ),
                borderRadius: BorderRadius.circular(8.r)),
          ),
        ),
      ),
    );
  }
}
