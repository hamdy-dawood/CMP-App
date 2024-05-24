import 'package:cmp_app/features/covenants/covenants_cubit.dart';
import 'package:cmp_app/features/nav_bar_pages/home/home_cubit.dart';
import 'package:cmp_app/features/nav_bar_pages/tasks/tasks_cubit.dart';
import 'package:cmp_app/features/notifications/notifications_cubit.dart';
import 'package:cmp_app/features/profile/profile_data_cubit.dart';
import 'package:cmp_app/features/task_details/task_details_cubit.dart';
import 'package:cmp_app/features/upload_files/upload_file_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/helpers/navigator.dart';
import 'features/nav_bar_pages/chat/cubit.dart';
import 'features/register/cubit.dart';
import 'features/splash/view.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus!.unfocus(),
          child: MultiBlocProvider(
            providers: [
              BlocProvider(create: (context) => ChatCubit()),
              BlocProvider(create: (context) => RegisterCubit()),
              BlocProvider(create: (context) => TasksCubit()),
              BlocProvider(create: (context) => TaskDetailsCubit()),
              BlocProvider(create: (context) => NotificationsCubit()),
              BlocProvider(create: (context) => CovenantsCubit()),
              BlocProvider(create: (context) => ProfileDataCubit()),
              BlocProvider(create: (context) => HomeCubit()),
              BlocProvider(create: (context) => UploadFileCubit()),
            ],
            child: MaterialApp(
              title: "CMP App",
              debugShowCheckedModeBanner: false,
              navigatorKey: navigatorKey,
              home: child,
            ),
          ),
        );
      },
      child: const SplashView(),
    );
  }
}
