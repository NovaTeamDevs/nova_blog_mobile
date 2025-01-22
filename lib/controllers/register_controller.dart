import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class RegisterController  extends GetxController {
  XFile? userImage;
  bool isLoading = false;

  final TextEditingController usernameTxtController = TextEditingController();
  final TextEditingController fullNameTxtController = TextEditingController();
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
}