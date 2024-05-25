import 'package:cmp_app/core/helpers/navigator.dart';
import 'package:cmp_app/core/theming/assets.dart';
import 'package:cmp_app/core/theming/colors.dart';
import 'package:cmp_app/core/widgets/custom_text.dart';
import 'package:cmp_app/features/task_details/task_details_cubit.dart';
import 'package:cmp_app/features/task_sent/view.dart';
import 'package:cmp_app/features/upload_files/upload_file_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TaskItem extends StatelessWidget {
  const TaskItem({
    super.key,
    required this.title,
    required this.date,
    required this.isFinish, required this.taskId, required this.subTaskId, required this.fileUpload,
  });
  final String title, date, isFinish, taskId, subTaskId, fileUpload;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if(fileUpload == '1' && isFinish == '0') {
          MagicRouter.navigateTo(page: UploadFilesView(
            taskId: taskId,
            subTaskId: subTaskId,
          ));
        }else {
          MagicRouter.navigateTo(page: const TaskSentView());
        }
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 10.h),
        padding: EdgeInsets.only(top: 10.h, bottom: 20.h),
        decoration: BoxDecoration(
          border: Border.all(color: ColorManager.black, width: 0.5),
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              BlocProvider.of<TaskDetailsCubit>(context).selectedSubTask == subTaskId ? Center(child: CircularProgressIndicator(color: ColorManager.mainColor,),) : Icon(isFinish == '1' ? Icons.check_box_outlined : Icons.check_box_outline_blank,size: 30.sp,color: ColorManager.mainColor,),
              SizedBox(width: 20.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomText(
                    text: title,
                    color: ColorManager.black,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w400,
                  ),
                  CustomText(
                    text: date,
                    color: ColorManager.grey,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ],
              ),
              if(fileUpload == "1" && isFinish == '0')
              const Spacer(),
              if(fileUpload == "1" && isFinish == '0')
              Icon(Icons.arrow_circle_up_outlined,color: ColorManager.grey,),
            ],
          ),
        ),
      ),
    );
  }
}
