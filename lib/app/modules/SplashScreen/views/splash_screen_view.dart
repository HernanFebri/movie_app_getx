import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/utils/colors.dart';
import '../controllers/splash_screen_controller.dart';

class SplashScreenView extends GetView<SplashScreenController> {
  final SplashScreenController controller = Get.find<SplashScreenController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // Gunakan BoxDecoration untuk gradasi warna
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColors.primaryColor, AppColors.scaffoldBgColor2],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/logo_splash.png'),
              const SizedBox(
                height: 20,
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
