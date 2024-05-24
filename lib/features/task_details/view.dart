import 'package:cmp_app/core/functions/app_functions.dart';
import 'package:cmp_app/core/theming/colors.dart';
import 'package:cmp_app/core/widgets/app_bar.dart';
import 'package:cmp_app/core/widgets/custom_text.dart';
import 'package:cmp_app/core/widgets/error_widget.dart';
import 'package:cmp_app/features/nav_bar_pages/home/widgets/task_item.dart';
import 'package:cmp_app/features/task_details/task_details_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'widgets/pie_chart.dart';

class TaskDetails extends StatefulWidget {
  final String taskId;
  const TaskDetails({super.key, required this.taskId,});

  @override
  State<TaskDetails> createState() => _TaskDetailsState();
}

class _TaskDetailsState extends State<TaskDetails> {

  @override
  void initState() {
    super.initState();
    BlocProvider.of<TaskDetailsCubit>(context).getTaskDetails(widget.taskId??'');
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
        child: BlocConsumer<TaskDetailsCubit, TaskDetailsState>(
          listener: (context, state) {
            if(state is FinishUnFinishSubTaskErrorState){
              AppFunctions.showsToast(state.message, ColorManager.red, context);
            }
            if(state is FinishUnFinishSubTaskSuccessState){
              // AppFunctions.showsToast(state.message, ColorManager.successGreen, context);
              // BlocProvider.of<TaskDetailsCubit>(context).getTaskDetails(widget.taskId??'');
            }
          },
  builder: (context, state) {
    if(state is TaskDetailsLoadingState) {
              return Center(child: CircularProgressIndicator(color: ColorManager.mainColor,),);
            }
            if(state is TaskDetailsErrorState){
      return DefaultErrorWidget(onTap: () => BlocProvider.of<TaskDetailsCubit>(context).getTaskDetails(widget.taskId??''), errorMessage: state.message);
    }
    else{
      return ListView(
        children: [
          SizedBox(height: 20.h),
          CustomText(
            text: BlocProvider.of<TaskDetailsCubit>(context).taskDetailsModel?.data?.first.title??'',
            color: ColorManager.black,
            fontSize: 24.sp,
            fontWeight: FontWeight.w400,
          ),
          SizedBox(height: 10.h),
          PieChartWidget(
            finishOnTime: ((BlocProvider.of<TaskDetailsCubit>(context).taskDetailsModel?.statistics?.onTimeSubTasksPercentage??0)/10).toDouble(),
            pastDeadline: ((BlocProvider.of<TaskDetailsCubit>(context).taskDetailsModel?.statistics?.notOnTimeSubTasksPercentage??0)/10).toDouble(),
            stillAngling: ((BlocProvider.of<TaskDetailsCubit>(context).taskDetailsModel?.statistics?.stillAnglingPercentage??0)/10).toDouble(),
          ),
          SizedBox(height: 20.h),
          CustomText(
            text: "Description",
            color: ColorManager.black,
            fontSize: 18.sp,
            fontWeight: FontWeight.w700,
          ),
          Text(
            BlocProvider.of<TaskDetailsCubit>(context).taskDetailsModel?.data?.first.taskDescription??'',
            style: TextStyle(
              color: ColorManager.grey4,
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(height: 30.h),
          CustomText(
            text: "Sub Task",
            color: ColorManager.black,
            fontSize: 16.sp,
            fontWeight: FontWeight.w700,
          ),
          SizedBox(height: 20.h),
          ListView(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: List.generate(
              BlocProvider.of<TaskDetailsCubit>(context).taskDetailsModel?.subTasks?.length ?? 0,
                  (index) => TaskItem(
                    title: BlocProvider.of<TaskDetailsCubit>(context).taskDetailsModel?.subTasks?[index]
                        .name ??
                        '',
                    date: BlocProvider.of<TaskDetailsCubit>(context).taskDetailsModel?.subTasks?[index]
                        .time ??
                        '',
                    isFinish: BlocProvider.of<TaskDetailsCubit>(context).taskDetailsModel?.subTasks?[index]
                        .finished ??
                        '',
                    taskId: widget.taskId,
                    subTaskId: BlocProvider.of<TaskDetailsCubit>(context).taskDetailsModel?.subTasks?[index]
                        .subTaskId ??
                        '',
                    fileUpload: BlocProvider.of<TaskDetailsCubit>(context).taskDetailsModel?.subTasks?[index]
                        .fileUpload ??
                        '',
                  ),
            ),
          )
        ],
      );
    }
  },
),
      ),
    );
  }
}
