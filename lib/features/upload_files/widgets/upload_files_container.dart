import 'package:cmp_app/core/theming/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UploadFilesContainer extends StatelessWidget {
   const UploadFilesContainer({
    super.key,
    required  this.name,
    required  this.description,
    required this.onDelete,
    });
    
    final String name ;
    final String description ;
    final VoidCallback onDelete ;
  @override
  Widget build(BuildContext context) {
    return  Padding(
            padding:  EdgeInsets.only(left:10.w, right: 10.w,top: 15.h ),
            child: Material(
              borderRadius: BorderRadius.circular(10.w),
              elevation: 2,
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 10.h,horizontal: 10.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.w),
                  color: ColorManager.white,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: 
                  [
                    Center(
                      child: Padding(
                        padding:  EdgeInsets.symmetric(horizontal:10.w ),
                        child: Container(
                          width: 75.w,
                          height: 70.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.w),
                            color: Colors.transparent,
                          ),
                          child: Icon(Icons.file_open_outlined,color: ColorManager.mainColor,size: 50,),
                        ),
                      ),
                    ),
                  
                   Expanded(
                     child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:
                      [
                         Text(
                          name,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith( color: ColorManager.black),
                      ),
                      SizedBox(
                        width: 215.w,
                        // color: ColorManager.defualtColor,
                        child: Text(
                           description,
                          style: Theme.of(context).textTheme.bodySmall?.copyWith( color: ColorManager.grey),
                           maxLines: 3,
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.only(top: 5.h),
                        child: Container(
                          width: 220.w,
                          child: Divider(color: ColorManager.mainColor,height: 4.h,thickness: 4,)),
                      )
                      ],
                     ),
                   ),

                   InkWell(
                    
                    onTap:onDelete,
                     child: Padding(
                       padding:  EdgeInsets.only(top: 10.h,left: 5.w ),
                       child: Icon(Icons.clear,color: ColorManager.grey,),
                     ),
                   ),

                  ],
                ),
              ),
            ),
          );
  }
}