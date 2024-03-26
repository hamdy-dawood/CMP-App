import 'package:cmp_app/core/theming/colors.dart';
import 'package:cmp_app/core/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CovenantsItem extends StatelessWidget {
  const CovenantsItem({
    super.key,
    required this.image,
    required this.title,
    required this.subTitle,
    required this.address,
  });

  final String image, title, subTitle, address;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.h),
      margin: EdgeInsets.all(12.h),
      decoration: BoxDecoration(
        border: Border.all(color: ColorManager.black),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 120.h,
            width: 0.35.sw,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.r),
              child: Image.asset(
                image,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: 10.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: title,
                  color: ColorManager.black,
                  fontSize: 22.sp,
                  fontWeight: FontWeight.w400,
                ),
                SizedBox(height: 10.h),
                Text(
                  subTitle,
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: ColorManager.grey4,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                      ),
                ),
                SizedBox(height: 10.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.location_on,
                      color: ColorManager.mainColor,
                    ),
                    Expanded(
                      child: CustomText(
                        text: address,
                        color: ColorManager.grey4,
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
