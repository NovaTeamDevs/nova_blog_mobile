import 'package:get/get.dart';

class NavigationController extends GetxController {
  int selectedIndex = 0;

  void updatePage({required int pageIndex}) {
    selectedIndex = pageIndex;
    update();
  }
}