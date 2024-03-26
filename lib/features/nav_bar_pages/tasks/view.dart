import 'package:cmp_app/core/theming/colors.dart';
import 'package:cmp_app/core/widgets/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'widgets/task_item.dart';

class TasksView extends StatefulWidget {
  const TasksView({super.key});

  @override
  State<TasksView> createState() => _TasksViewState();
}

class _TasksViewState extends State<TasksView>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _TasksBody(tabController: tabController);
  }
}

class _TasksBody extends StatelessWidget {
  const _TasksBody({required this.tabController});

  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      appBar: CustomAppBar(
        text: "Tasks",
        backgroundColor: ColorManager.white,
        leadingColor: ColorManager.white,
        withLeading: false,
        textColor: ColorManager.mainColor,
      ),
      body: SizedBox(
        width: 1.sw,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 20.h),
              height: 150.h,
              width: 0.8.sw,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
                color: ColorManager.mainColor,
              ),
            ),
            Container(
              height: 58.h,
              width: 0.7.sw,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(9.r),
                border: Border.all(color: ColorManager.black, width: 0.5),
              ),
              child: Padding(
                padding: EdgeInsets.all(4.h),
                child: TabBar(
                  controller: tabController,
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(7.r),
                    color: ColorManager.mainColor,
                  ),
                  indicatorColor: ColorManager.mainColor,
                  indicatorSize: TabBarIndicatorSize.tab,
                  dividerColor: Colors.transparent,
                  labelColor: ColorManager.white,
                  unselectedLabelColor: ColorManager.grey7,
                  labelStyle: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w400,
                  ),
                  unselectedLabelStyle: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                  ),
                  tabs: const [
                    FittedBox(child: Text("All tasks")),
                    FittedBox(child: Text("Today tasks")),
                  ],
                ),
              ),
            ),
            SizedBox(height: 30.h),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: TabBarView(
                  controller: tabController,
                  children: [
                    ListView(
                      children: [
                        TaskItemTasks(
                          timeFrom: "09:00 AM",
                          timeTo: "10:00 PM",
                          mainColor: ColorManager.orange,
                          title: "Landing page design",
                          subtitle: "2AM - 5PM",
                          percent: 1,
                          percentText: "100 %",
                        ),
                        TaskItemTasks(
                          timeFrom: "11:00 AM",
                          timeTo: "11:00 PM",
                          mainColor: ColorManager.purple,
                          title: "Education app design",
                          subtitle: "12AM - 4PM",
                          percent: 0.3,
                          percentText: "30 %",
                        ),
                        TaskItemTasks(
                          timeFrom: "12:00 AM",
                          timeTo: "10:00 PM",
                          mainColor: ColorManager.blueSky,
                          title: "Dashboard redesign",
                          subtitle: "12AM - 4PM",
                          percent: 0.8,
                          percentText: "80 %",
                        ),
                      ],
                    ),
                    ListView(
                      children: [
                        TaskItemTasks(
                          timeFrom: "12:00 AM",
                          timeTo: "10:00 PM",
                          mainColor: ColorManager.blueSky,
                          title: "Dashboard redesign",
                          subtitle: "12AM - 4PM",
                          percent: 0.8,
                          percentText: "80 %",
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
