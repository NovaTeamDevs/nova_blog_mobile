import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:nova_blog_mobile/views/auth_view.dart';
import 'package:nova_blog_mobile/views/main_view.dart';

class SplashController extends GetxController {

  Future<void> splashNavigate() async {
    final FlutterSecureStorage secureStorage = FlutterSecureStorage();
    final token = await secureStorage.read(key: "token");
    await Future.delayed(Duration(seconds: 3));
    if(token == null) {
      Get.offAll(AuthView());
    } else {
      Get.offAll(MainView());
    }

  }

  @override
  void onInit() {
    splashNavigate();
    super.onInit();
  }

}