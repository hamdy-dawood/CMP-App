import 'package:cmp_app/core/theming/colors.dart';
import 'package:cmp_app/core/widgets/custom_text.dart';
import 'package:cmp_app/core/widgets/error_widget.dart';
import 'package:cmp_app/features/nav_bar_pages/chat/components/chat_item.dart';
import 'package:cmp_app/features/nav_bar_pages/chat/cubit.dart';
import 'package:cmp_app/features/nav_bar_pages/home/home_cubit.dart';
import 'package:cmp_app/features/nav_bar_pages/home/widgets/percent_container.dart';
import 'package:cmp_app/features/nav_bar_pages/tasks/widgets/task_item.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'widgets/fl_chart.dart';
import 'widgets/main_app_bar_view.dart';
import 'widgets/target_container.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  @override
  void initState() {
    super.initState();
    BlocProvider.of<HomeCubit>(context).getHome();
  }

  @override
  Widget build(BuildContext context) {
    var chatCubit = context.read<ChatCubit>();
    return Container(
      color: ColorManager.white,
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if(state is HomeSuccessState) {
            return Scaffold(
              backgroundColor: ColorManager.mainColor,
              body: Column(
                children: [
                  MainAppBarView(
                    totalTarget: (state.homeModel.taskStatistics?.totalTarget??0).toDouble(),
                    userData: state.homeModel.userData,
                  ),
                  Expanded(
                    child: Stack(
                      children: [
                        Container(
                          width: 1.sw,
                          margin: EdgeInsets.only(top: 25.h),
                          decoration: BoxDecoration(
                            color: ColorManager.white,
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(14.r),
                            ),
                          ),
                        ),
                        Column(
                          children: [
                            TargetContainer(
                              todayTarget: (state.homeModel.taskStatistics?.achievedTodayTarget??0).toString(),
                              weeklyTarget: (state.homeModel.taskStatistics?.weeklyTarget??0).toString(),
                            ),
                            Expanded(
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    FlCarts(
                                      attendanceStatistics: state.homeModel.attendanceStatistics??{},
                                    ),
                                    PercentContainer(
                                      percent: (state.homeModel.taskStatistics?.completionPercentage??0).toDouble(),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left: 20.w, right: 20.w, top: 10.h),
                                      child: Column(
                                        children: [
                                          Align(
                                            alignment: Alignment.centerLeft,
                                            child: CustomText(
                                              text: "Chats",
                                              color: ColorManager.mainColor,
                                              fontSize: 20.sp,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                          SizedBox(height: 20.h),
                                          SizedBox(
                                            height: 120.h,
                                            child: StreamBuilder(
                                                stream:
                                                chatCubit.getUsersStream(),
                                                builder: (context, snapshot) {
                                                  if (snapshot.connectionState ==
                                                      ConnectionState.waiting) {
                                                    return const Center(
                                                      child:
                                                      CircularProgressIndicator(),
                                                    );
                                                  }
                                                  if (snapshot.hasError) {
                                                    return const Text(
                                                        'there is an error');
                                                  }
                                                  return ListView.builder(
                                                    itemCount:
                                                    snapshot.data!.length,
                                                    scrollDirection:
                                                    Axis.horizontal,
                                                    itemBuilder:
                                                        (BuildContext context,
                                                        int index) {
                                                      final userData =
                                                      snapshot.data![index];
                                                      if (userData['email'] !=
                                                          FirebaseAuth
                                                              .instance
                                                              .currentUser!
                                                              .email) {
                                                        return ChatItem(
                                                          receiverUsername:
                                                          userData[
                                                          'username'] ??
                                                              '',
                                                          receiverId:
                                                          userData['uid'],
                                                          body: "I'm busy .",
                                                          index: index,
                                                          inHome: true,
                                                        );
                                                      } else {
                                                        return Container();
                                                      }
                                                    },
                                                  );
                                                }),
                                          )
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left: 20.w, right: 20.w),
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: [
                                          CustomText(
                                            text: "Your Task",
                                            color: ColorManager.mainColor,
                                            fontSize: 20.sp,
                                            fontWeight: FontWeight.w700,
                                          ),
                                          // TextButton(
                                          //   onPressed: () {},
                                          //   child: CustomText(
                                          //     text: "See All",
                                          //     color: ColorManager.grey4,
                                          //     fontSize: 11.sp,
                                          //     fontWeight: FontWeight.w700,
                                          //   ),
                                          // ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                      EdgeInsets.symmetric(horizontal: 15.w,vertical: 10.h),
                                      child: SingleChildScrollView(
                                        child: Column(
                                          children: List.generate((state.homeModel.tasks??[]).length, (index) => TaskItemTasks(task: (state.homeModel.tasks??[])[index])),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }
          if(state is HomeErrorState){
            return DefaultErrorWidget(onTap: () => BlocProvider.of<HomeCubit>(context).getHome(), errorMessage: state.message);
          }else{
            return Center(child: CircularProgressIndicator(color: ColorManager.mainColor,),);
          }
        },
      ),
    );
  }
}
