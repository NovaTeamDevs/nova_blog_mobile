import 'package:get/get.dart';
import 'package:nova_blog_mobile/views/auth_view.dart';

class SplashController extends GetxController {

  Future<void> splashNavigate() async {
    await Future.delayed(Duration(seconds: 3));
    Get.offAll(AuthView());
  }

  @override
  void onInit() {
    splashNavigate();
    super.onInit();
  }

}