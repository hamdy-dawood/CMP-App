import 'package:cmp_app/core/helpers/navigator.dart';
import 'package:cmp_app/core/theming/colors.dart';
import 'package:cmp_app/core/widgets/custom_elevated.dart';
import 'package:cmp_app/core/widgets/custom_text.dart';
import 'package:cmp_app/features/upload_files/widgets/upload_files_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:file_picker/file_picker.dart';


class UploadFilesView extends StatefulWidget {
  const UploadFilesView({super.key});

  @override
  State<UploadFilesView> createState() => _UploadFilesViewState();
}

class _UploadFilesViewState extends State<UploadFilesView> {


  FilePickerResult? result;
  List<String?> images = [];
  List<String?> imagesNames = [];

  Future<void> pickFile () async {
    result =
    await FilePicker.platform.pickFiles(
      allowMultiple: true,  type: FileType.custom,
      allowedExtensions: ['jpg', 'pdf', 'doc'],
        );
    if (result != null) {
      for (var element in result!.files) {
        images.add(element.path);
        imagesNames.add(element.name);
        debugPrint(element.name);
        debugPrint(images.toString());
        debugPrint(imagesNames.toString());
      }
      setState(() {});
    }
  }

  void  delete (String image,String imageName,)
  {
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
      body: Column(
        children: [
          images.isEmpty ?
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 150.h,),
              Text(
                'No Files Selected .',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: ColorManager.orange),
              ),
            ],
          )
              : Expanded(
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              itemCount:   images.length, // result?.files.length ?? 0,
              itemBuilder: (context, index) {
                return
                  UploadFilesContainer(
                    name :  imagesNames[index] ?? '',
                    description: '',
                    onDelete: ()
                    {
                      delete(images[index]??'',imagesNames[index]??'');
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
            padding:  EdgeInsets.only(bottom: 20.h ,left: 20.w, right: 20.w ),
            child: CustomElevated(text: "pick files", press: () {
              pickFile();
            }, btnColor: ColorManager.mainColor),
          ),
        ],
      ),
    );
  }
}
