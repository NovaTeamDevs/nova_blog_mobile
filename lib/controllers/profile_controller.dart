import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/route_manager.dart';

import 'package:image_picker/image_picker.dart';
import 'package:nova_blog_mobile/core/services/web_service.dart';
import 'package:nova_blog_mobile/models/profile_model.dart';

class ProfileController extends GetxController {
  ProfileModel? profileInfo;
  XFile? newAvatar;
  final WebService _webService = WebService();
  final TextEditingController updateUserFirstNameTxt = TextEditingController();
  final TextEditingController updateUserLastNameTxt = TextEditingController();
  final TextEditingController oldPassTxt = TextEditingController();
  final TextEditingController confirmPassTxt = TextEditingController();

  Future<void> getUserInfo() async {

      final response = await _webService.getRequest(endPoint: "/user/profile",token: await _getToken());

      if(response.statusCode == 200) {
        profileInfo = ProfileModel.fromJson(response.data["data"]);
      } else {
        final errorMessage = response.data["message"];
        Get.snackbar("خطا", errorMessage,backgroundColor: Colors.red);
      }
  }

  Future<void> updateProfile() async {
    final Map<String,dynamic> body = {
      "first_name" : updateUserFirstNameTxt.text,
      "last_name" : updateUserLastNameTxt.text
    };
    final response = await _webService.postRequest(endPoint: "/user/update-profile",body: body,token: await _getToken());

    if(response.statusCode == 200) {
      Get.back();
      Get.snackbar("عملیات موفق", "اطلاعات شما با موفقیت ویرایش شد",backgroundColor: Colors.green);
    } else {
      final errorMessage = response.data["message"];
      Get.snackbar("خطا", errorMessage,backgroundColor: Colors.red);
    }
  }

  Future<void> updatePassword() async {
    final Map<String,dynamic> body = {
      "password" : oldPassTxt.text,
      "password_confirmation" : confirmPassTxt.text
    };
    final response = await _webService.postRequest(endPoint: "/user/update-profile",body: body,token: await _getToken());

    if(response.statusCode == 200) {
      Get.back();
      Get.snackbar("عملیات موفق", "اطلاعات شما با موفقیت ویرایش شد",backgroundColor: Colors.green);
    } else {
      final errorMessage = response.data["message"];
      Get.snackbar("خطا", errorMessage,backgroundColor: Colors.red);
    }
  }
  
  Future<void> updateAvatar() async {
    final FormData formData = FormData.fromMap({
      "avatar" : MultipartFile.fromFileSync(newAvatar!.path)
    });
    final response = await _webService.postRequest(endPoint: "/user/update-avatar",formData: formData,token: await _getToken());

    if(response.statusCode == 200) {
      Get.back();
      Get.snackbar("عملیات موفق", "اطلاعات شما با موفقیت ویرایش شد",backgroundColor: Colors.green);
    } else {
      final errorMessage = response.data["message"];
      Get.snackbar("خطا", errorMessage,backgroundColor: Colors.red);
    }
  }

  Future<String?> _getToken() async {
    final FlutterSecureStorage secureStorage = FlutterSecureStorage();
    final token = await secureStorage.read(key: "token");
    return token;
  }


  @override
  void onInit() {
    super.onInit();
    getUserInfo();
  }

}