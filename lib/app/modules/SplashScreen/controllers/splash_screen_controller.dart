import 'package:get/get.dart';

class SplashScreenController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    _startSplashScreen();
  }

  void _startSplashScreen() async {
    await Future.delayed(const Duration(seconds: 3)); // Durasi splash screen
    Get.offNamed('/home'); // Pindah ke halaman utama
  }
}
