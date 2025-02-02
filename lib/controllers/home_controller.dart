import 'package:get/get.dart';

class HomeController extends GetxController {
  int selectedSliderIndex = 0;

  void updateSliderIndicator(int newIndex) {
    selectedSliderIndex = newIndex;
    update();
  }
}