import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/utils/colors.dart';
import '../controllers/splash_screen_controller.dart';

class SplashScreenView extends GetView<SplashScreenController> {
  final SplashScreenController controller = Get.find<SplashScreenController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBgColor,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/logo.png',
                fit: BoxFit.cover,
                filterQuality: FilterQuality.high,
              ),
              const SizedBox(
                height: 50,
              ),
              const CircularProgressIndicator(
                color: AppColors.loadingIndicatorColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
