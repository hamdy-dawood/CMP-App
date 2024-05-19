import 'package:cmp_app/core/theming/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DefaultErrorWidget extends StatefulWidget {
  final void Function() onTap;
  final String errorMessage;
  const DefaultErrorWidget({super.key, required this.onTap, required this.errorMessage});

  @override
  State<DefaultErrorWidget> createState() => _DefaultErrorWidgetState();
}

class _DefaultErrorWidgetState extends State<DefaultErrorWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(Icons.refresh,color: ColorManager.mainColor,size: 40.sp,),
        SizedBox(height: 20.h,),
        InkWell(
          overlayColor: const MaterialStatePropertyAll(Colors.transparent),
          onTap: widget.onTap,
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 10.h),
            margin: EdgeInsets.symmetric(horizontal: 50.h),
            decoration: BoxDecoration(
              color: ColorManager.mainColor,
              borderRadius: BorderRadius.circular(15.sp),
            ),
            child: Text(widget.errorMessage,style: TextStyle(color: ColorManager.white,fontSize: 10.sp),textAlign: TextAlign.center,),
          ),
        ),
      ],
    );
  }
}
