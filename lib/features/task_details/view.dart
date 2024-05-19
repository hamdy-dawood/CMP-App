import 'package:cmp_app/core/helpers/navigator.dart';
import 'package:cmp_app/core/theming/assets.dart';
import 'package:cmp_app/core/theming/colors.dart';
import 'package:cmp_app/core/widgets/app_bar.dart';
import 'package:cmp_app/core/widgets/custom_text.dart';
import 'package:cmp_app/core/widgets/error_widget.dart';
import 'package:cmp_app/features/nav_bar_pages/home/widgets/task_item.dart';
import 'package:cmp_app/features/nav_bar_pages/tasks/model.dart';
import 'package:cmp_app/features/task_details/task_details_cubit.dart';
import 'package:cmp_app/features/task_sent/view.dart';
import 'package:cmp_app/features/upload_files/upload_file_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'widgets/pie_chart.dart';

class TaskDetails extends StatefulWidget {
  final Task task;
  const TaskDetails({super.key, required this.task});

  @override
  State<TaskDetails> createState() => _TaskDetailsState();
}

class _TaskDetailsState extends State<TaskDetails> {

  @override
  void initState() {
    super.initState();
    BlocProvider.of<TaskDetailsCubit>(context).getTaskDetails(widget.task.taskId??'');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      appBar: CustomAppBar(
        text: "Task Details",
        backgroundColor: ColorManager.white,
        leadingColor: ColorManager.mainColor,
        textColor: ColorManager.mainColor,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: ListView(
          children: [
            SizedBox(height: 20.h),
            CustomText(
              text: widget.task.title??'',
              color: ColorManager.black,
              fontSize: 24.sp,
              fontWeight: FontWeight.w400,
            ),
            SizedBox(height: 10.h),
            PieChartWidget(
              finishOnTime: double.parse(widget.task.finishOnTimePerc??"0"),
              pastDeadline: double.parse(widget.task.pastDeadline??"0"),
              stillAngling: double.parse(widget.task.stillAngling??"0"),
            ),
            SizedBox(height: 20.h),
            CustomText(
              text: "Description",
              color: ColorManager.black,
              fontSize: 18.sp,
              fontWeight: FontWeight.w700,
            ),
            Text(
              widget.task.taskDescription??'',
              style: TextStyle(
                color: ColorManager.grey4,
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: 30.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  text: "Sub Task",
                  color: ColorManager.black,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w700,
                ),
                TextButton(
                  onPressed: () {},
                  child: CustomText(
                    text: "See All",
                    color: ColorManager.grey4,
                    fontSize: 11.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.h),
            BlocBuilder<TaskDetailsCubit, TaskDetailsState>(
              builder: (context, state) {
                if(state is TaskDetailsSuccessState) {
                  return ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: List.generate(
                      state.taskDetailsModel.message?.length??0,
                      (index) => GestureDetector(
                        onTap: () {
                          // MagicRouter.navigateTo(page: const TaskSentView());
                          MagicRouter.navigateTo(page: const UploadFilesView());
                        },
                        child: TaskItem(
                          image: AssetsStrings.task1Image,
                          title: state.taskDetailsModel.message?[index].name??'',
                          date: state.taskDetailsModel.message?[index].time??'',
                        ),
                      ),
                    ),
                  );
                }
                if(state is TaskDetailsErrorState){
                  return DefaultErrorWidget(onTap: () => BlocProvider.of<TaskDetailsCubit>(context).getTaskDetails(widget.task.taskId??''), errorMessage: state.message);
                }else{
                  return Center(child: CircularProgressIndicator(color: ColorManager.mainColor,),);
                }
              },
            )

          ],
        ),
      ),
    );
  }
}
