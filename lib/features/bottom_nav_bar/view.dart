import 'package:cmp_app/core/theming/colors.dart';
import 'package:cmp_app/features/nav_bar_pages/chats/view.dart';
import 'package:cmp_app/features/nav_bar_pages/home/view.dart';
import 'package:cmp_app/features/nav_bar_pages/tasks/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'bottom_bar_item.dart';
import 'controller.dart';
import 'cubit.dart';
import 'states.dart';

class NavBarView extends StatefulWidget {
  const NavBarView({super.key, this.initialIndex = 0});

  final int initialIndex;

  @override
  State<NavBarView> createState() => _NavBarViewState();
}

class _NavBarViewState extends State<NavBarView> {
  final controller = NavBarController();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    List<Widget> screens = List<Widget>.generate(
      3,
      (index) {
        switch (index) {
          case 0:
            return const HomeView();
          case 1:
            return const TasksView();
          case 2:
            return const ChatsView();
          default:
            return const HomeView();
        }
      },
    );

    return BlocProvider(
      create: (context) => NavBarCubit(controller, scaffoldKey),
      child: _NavBarBody(
        screens: screens,
        initialIndex: widget.initialIndex,
      ),
    );
  }
}

class _NavBarBody extends StatelessWidget {
  const _NavBarBody({
    required this.screens,
    required this.initialIndex,
  });
  final List<Widget> screens;
  final int initialIndex;

  @override
  Widget build(BuildContext context) {
    final cubit = NavBarCubit.get(context);
    cubit.controller.selectedItem = initialIndex;

    return BlocBuilder<NavBarCubit, NavBarStates>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: ColorManager.white,
          key: cubit.scaffoldKey,
          body: screens[cubit.controller.selectedItem],
          bottomNavigationBar: Material(
            elevation: 10,
            child: Container(
              height: 0.1.sh,
              color: ColorManager.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: BottomBarItem(
                      onPress: () {
                        cubit.selectItem(0);
                      },
                      icon: cubit.controller.icons[0],
                      isSelected: 0 == cubit.controller.selectedItem,
                    ),
                  ),
                  Expanded(
                    child: BottomBarItem(
                      onPress: () {
                        cubit.selectItem(1);
                      },
                      icon: cubit.controller.icons[1],
                      isSelected: 1 == cubit.controller.selectedItem,
                    ),
                  ),
                  Expanded(
                    child: BottomBarItem(
                      onPress: () {
                        cubit.selectItem(2);
                      },
                      icon: cubit.controller.icons[2],
                      isSelected: 2 == cubit.controller.selectedItem,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
