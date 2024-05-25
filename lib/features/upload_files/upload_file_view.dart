import 'package:cmp_app/core/functions/app_functions.dart';
import 'package:cmp_app/core/helpers/navigator.dart';
import 'package:cmp_app/core/theming/colors.dart';
import 'package:cmp_app/core/widgets/custom_elevated.dart';
import 'package:cmp_app/core/widgets/custom_text.dart';
import 'package:cmp_app/features/task_details/task_details_cubit.dart';
import 'package:cmp_app/features/upload_files/upload_file_cubit.dart';
import 'package:cmp_app/features/upload_files/widgets/upload_files_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:file_picker/file_picker.dart';


class UploadFilesView extends StatefulWidget {
  final String taskId;
  final String subTaskId;
  const UploadFilesView({super.key, required this.taskId, required this.subTaskId});

  @override
  State<UploadFilesView> createState() => _UploadFilesViewState();
}

class _UploadFilesViewState extends State<UploadFilesView> {


  FilePickerResult? result;
  List<String?> images = [];
  List<String?> imagesNames = [];

  Future<void> pickFile() async {
    result =
    await FilePicker.platform.pickFiles();
    if (result != null) {
      for (var element in result!.files) {
        if(mounted) {
          BlocProvider.of<UploadFileCubit>(context)
              .uploadFile(filePath: element.path??'');
        }
        images.add(element.path);
        imagesNames.add(element.name);
        debugPrint(element.name);
        debugPrint(images.toString());
        debugPrint(imagesNames.toString());
      }
      setState(() {});

    }
  }

  void delete(String image, String imageName,) {
    setState(() {
      images.remove(image);
      imagesNames.remove(imageName);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(180.h),
        child: Stack(
          children: [
            Container(
              height: 180.h,
              padding: EdgeInsets.symmetric(horizontal: 0.02.sw),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(24.r),
                ),
                color: ColorManager.mainColor,
              ),
              child: AppBar(
                elevation: 0,
                backgroundColor: Colors.transparent,
                title: CustomText(
                  text: "Uploads",
                  color: ColorManager.white,
                  fontSize: 25.sp,
                  fontWeight: FontWeight.w700,
                ),
                centerTitle: true,
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
              ),
            ),
          ],
        ),
      ),
      body: BlocConsumer<UploadFileCubit, UploadFileState>(
        listener: (context, state) {
          if(state is UploadFileSuccessState){
            BlocProvider.of<UploadFileCubit>(context).uploadTaskData(link: state.fileUrl, subTaskId: widget.subTaskId, taskId: widget.taskId);
          }
          if(state is UploadFileErrorState){
            AppFunctions.showsToast(state.message, ColorManager.red, context);
          }
          if(state is UploadTaskDataErrorState){
            // images.clear();
            // imagesNames.clear();
            AppFunctions.showsToast(state.message, ColorManager.red, context);
          }
          if(state is UploadTaskDataSuccessState){
            // images.clear();
            // imagesNames.clear();
            AppFunctions.showsToast(state.baseModel.message??'', ColorManager.successGreen, context);
          }
        },
        builder: (context, state) {
          return Column(
            children: [
              images.isEmpty ?
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: 150.h,),
                  Text(
                    'No Files Selected .',
                    style: Theme
                        .of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(color: ColorManager.orange),
                  ),
                ],
              )
                  : Expanded(
                child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  itemCount: images.length, // result?.files.length ?? 0,
                  itemBuilder: (context, index) {
                    return
                      UploadFilesContainer(
                        name: imagesNames[index] ?? '',
                        description: '',
                        onDelete: () {
                          delete(images[index] ?? '', imagesNames[index] ?? '');
                        },
                      );
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(height: 10.h,);
                  },
                ),
              ),

              if(images.isEmpty)
                const Spacer(),


              Padding(
                padding: EdgeInsets.only(bottom: 20.h, left: 20.w, right: 20.w),
                child: BlocBuilder<TaskDetailsCubit, TaskDetailsState>(builder: (context, state) => state is FinishUnFinishSubTaskLoadingState || state is TaskDetailsLoadingState ? Center(child: CircularProgressIndicator(color: ColorManager.mainColor,),) :  CustomElevated(text: "End Task", press: () {
                  if(images.isNotEmpty) BlocProvider.of<TaskDetailsCubit>(context).finishSubTask(taskId: widget.taskId, subTaskId: widget.subTaskId);
                }, btnColor: images.isNotEmpty? ColorManager.mainColor : ColorManager.grey),),
              ),

              Padding(
                padding: EdgeInsets.only(bottom: 20.h, left: 20.w, right: 20.w),
                child: state is UploadTaskDataLoadingState || state is UploadFileLoadingState ? Center(child: CircularProgressIndicator(color: ColorManager.mainColor,),) :  CustomElevated(text: "pick files", press: () {
                  pickFile();
                }, btnColor: ColorManager.mainColor),
              ),
            ],
          );
        },
      ),
    );
  }
}
