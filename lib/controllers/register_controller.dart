import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nova_blog_mobile/core/services/web_service.dart';

class RegisterController  extends GetxController {
  final WebService _webService = WebService();
  XFile? userImage;
  bool isLoading = false;

  final TextEditingController firstnameTxtController = TextEditingController();
  final TextEditingController lastnameTxtController = TextEditingController();
  final TextEditingController emailTxtController = TextEditingController();
  final TextEditingController passwordTxtController = TextEditingController();
  final TextEditingController repeatPasswordTxtController = TextEditingController();



  Future<void> takePhoto({required ImageSource source}) async {
    final picker = ImagePicker();
    final image = await picker.pickImage(source: source);

    if(image != null) {
      userImage = image;
      update();
    }

  }

  Future<bool> register() async {
    isLoading = true;
    update(["registerBtn"]);
    final Map<String,dynamic> body = {
      "first_name" : firstnameTxtController.text,
      "last_name" : lastnameTxtController.text,
      "email" : emailTxtController.text,
      "password" : passwordTxtController.text
    };
    final response = await _webService.postRequest(endPoint: "/auth/register",body: body);
    isLoading = false;
    update(["registerBtn"]);
    
    if(response.statusCode == 200) {
      final FlutterSecureStorage secureStorage = FlutterSecureStorage();
      await secureStorage.write(key: "token", value: response.data["token"]);
      return true;
    } else {
      Get.snackbar("خطا", response.data["message"],backgroundColor: Colors.red);
      return false;
    }
  }
}