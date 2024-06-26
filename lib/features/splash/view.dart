import 'package:cmp_app/core/helpers/cache_helper.dart';
import 'package:cmp_app/core/helpers/navigator.dart';
import 'package:cmp_app/core/theming/colors.dart';
import 'package:cmp_app/features/bottom_nav_bar/view.dart';
import 'package:cmp_app/features/start/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    _goNext();
  }

  _goNext() async {
    await Future.delayed(
      const Duration(seconds: 5),
      () {
        MagicRouter.navigateTo(
          page: CacheHelper.getId().isEmpty
              ? const StartView()
              : const NavBarView(),
          withHistory: false,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      body: SizedBox(
        width: 1.sw,
        height: 1.sh,
        child: Image.asset(
          "assets/images/cmp_splash_gif.gif",
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
