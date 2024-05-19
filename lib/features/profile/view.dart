import 'package:cmp_app/core/helpers/cache_helper.dart';
import 'package:cmp_app/core/helpers/navigator.dart';
import 'package:cmp_app/core/theming/assets.dart';
import 'package:cmp_app/core/theming/colors.dart';
import 'package:cmp_app/core/widgets/app_bar.dart';
import 'package:cmp_app/core/widgets/custom_text.dart';
import 'package:cmp_app/core/widgets/error_widget.dart';
import 'package:cmp_app/core/widgets/svg_icons.dart';
import 'package:cmp_app/features/bottom_nav_bar/view.dart';
import 'package:cmp_app/features/covenants/view.dart';
import 'package:cmp_app/features/profile/profile_data_cubit.dart';
import 'package:cmp_app/features/register/cubit.dart';
import 'package:cmp_app/features/register/states.dart';
import 'package:cmp_app/features/register/widgets/pick_image_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

import 'widgets/profile_item.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {

  @override
  void initState() {
    super.initState();
    BlocProvider.of<ProfileDataCubit>(context).getProfileData();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = RegisterCubit.get(context);

    return Scaffold(
      backgroundColor: ColorManager.white,
      appBar: CustomAppBar(
        text: "Profile",
        backgroundColor: ColorManager.mainColor,
        leadingColor: ColorManager.white,
        textColor: ColorManager.white,
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: 1.sw,
          child: BlocBuilder<ProfileDataCubit, ProfileDataState>(
            builder: (context, state) {
              if(state is ProfileDataSuccessState) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        Image.asset(
                          AssetsStrings.profile,
                        ),
                        Container(
                          height: 100.h,
                          width: 100.h,
                          clipBehavior: Clip.antiAlias,
                          decoration: const BoxDecoration(
                            color: Colors.transparent,
                            shape: BoxShape.circle,
                          ),
                          child: Image.network(
                            state.profileDataModel.message?.imageUrl??'',
                                  fit: BoxFit.cover,
                                ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.h),
                    BlocConsumer<RegisterCubit, RegisterStates>(
                      listener: (context, state) {
                        if (state is UploadImageStates) {
                          MagicRouter.navigatePop();
                          cubit.imageRegister();
                        } else if (state is AllRegisterSuccessState) {
                          MagicRouter.navigateTo(
                            page: const NavBarView(),
                            withHistory: false,
                          );
                        }
                      },
                      builder: (context, state) {
                        if (state is RegisterLoadingState) {
                          return Center(
                            child: CircularProgressIndicator(
                              color: ColorManager.mainColor,
                            ),
                          );
                        }
                        return PickImageWidget(
                          cubit: cubit,
                          onTapTwo: () {
                            cubit.chooseImage(
                              source: ImageSource.gallery,
                            );
                          },
                          onTapOne: () {
                            cubit.chooseImage(
                              source: ImageSource.camera,
                            );
                          },
                          child: SvgIcon(
                            icon: AssetsStrings.camera,
                            color: ColorManager.purple,
                            height: 20.h,
                          ),
                        );
                      },
                    ),
                    SizedBox(height: 10.h),
                    CustomText(
                      text: state.profileDataModel.message?.name??'',
                      color: ColorManager.black,
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w700,
                    ),
                    CustomText(
                      text: state.profileDataModel.message?.email??'',
                      color: ColorManager.grey4,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w700,
                    ),
                    SizedBox(height: 20.h),
                    ProfileItem(
                      icon: AssetsStrings.entryDate,
                      title: "Entry Date",
                      subTitle: (state.profileDataModel.message?.addedDate??'').split(" ")[0],
                    ),
                    ProfileItem(
                      icon: AssetsStrings.id,
                      title: "ID",
                      subTitle: state.profileDataModel.message?.userId??'',
                    ),
                    ProfileItem(
                      icon: AssetsStrings.phone,
                      title: "Phone Number",
                      subTitle: state.profileDataModel.message?.phone??'',
                    ),
                    const ProfileItem(
                      icon: AssetsStrings.ip,
                      title: "IP",
                      subTitle: "18526346286111",
                    ),
                    GestureDetector(
                      onTap: () {
                        MagicRouter.navigateTo(page: const CovenantsView());
                      },
                      child: const ProfileItem(
                        icon: AssetsStrings.covenants,
                        title: "Covenants",
                        subTitle: "",
                        withTrailing: true,
                      ),
                    ),
                  ],
                );
              }
              if(state is ProfileDataErrorState){
                return DefaultErrorWidget(onTap: () => BlocProvider.of<ProfileDataCubit>(context).getProfileData(), errorMessage: state.message);
              }else{
                return Center(child: CircularProgressIndicator(color: ColorManager.mainColor,),);
              }
            },
          ),
        ),
      ),
    );
  }
}
