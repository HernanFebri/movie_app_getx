import 'package:get/get.dart';

class HomeController extends GetxController {
  var searchQuery = ''.obs;
  var isCardVisible = true.obs;
  var items = <String>[
    'Item 1',
    'Item 2',
    'Item 3',
    // Tambahkan lebih banyak item sesuai kebutuhan
  ].obs;
}
