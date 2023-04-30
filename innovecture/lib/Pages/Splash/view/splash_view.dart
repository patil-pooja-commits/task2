import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:innovecture/utils/app_colors.dart';

import '../controller/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.blackColor,
      body: Center(
        child: Text(
          "TASK",
          style: TextStyle(color: AppColors.whiteColor),
        ),
      ),
    );
  }
}
