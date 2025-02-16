import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:nova_blog_mobile/core/services/web_service.dart';
import 'package:nova_blog_mobile/views/main_view.dart';

class LoginController extends GetxController {
  final WebService _webService = WebService();
  final TextEditingController emailTxtController = TextEditingController();
  final TextEditingController passwordTxtController = TextEditingController();
  bool isLoading = false;
  
  Future<void> login() async {
    isLoading = true;
    update();
    final Map<String,dynamic> body = {
      "email" : emailTxtController.text,
      "password" : passwordTxtController.text
    };
    final response = await _webService.postRequest(endPoint: "/auth/login",body: body);
    isLoading = false;
    update();
    
    if(response.statusCode == 200) {
      final FlutterSecureStorage secureStorage = FlutterSecureStorage();
      await secureStorage.write(key: "token", value: response.data["token"]);
      Get.offAll(MainView());
    } else {
      final errorMessage = response.data["message"];
      Get.snackbar("خطا", errorMessage,backgroundColor: Colors.red);
    }
    
  }
  
}