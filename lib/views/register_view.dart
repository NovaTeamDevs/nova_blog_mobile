import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nova_blog_mobile/controllers/register_controller.dart';
import 'package:nova_blog_mobile/core/constants/app_colors.dart';
import 'package:nova_blog_mobile/core/constants/app_strings.dart';
import 'package:nova_blog_mobile/core/widgets/custom_button_widget.dart';
import 'package:nova_blog_mobile/core/widgets/custom_text_field.dart';
import 'package:get/get.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20.0),
        child: GetBuilder<RegisterController>(
            id: "registerBtn",
            builder: (controller) => CustomButtonWidget(
                onTap: () async {
                  final bool isRegister = await controller.register();

                  if(isRegister) {
                    Get.snackbar("عملیات موفق", "ثبت نام با موفقیت انجام شد!",backgroundColor: Colors.green);
                  }
                },
                txt: AppStrings.createAccount,isLoading: controller.isLoading)),
      ),
      appBar: AppBar(
        title: Text(AppStrings.createAccount,style: GoogleFonts.vazirmatn(fontSize: 24,fontWeight: FontWeight.bold)),
        centerTitle: true,
        automaticallyImplyLeading: false,
        actions: [
          GestureDetector(
            onTap: () => Get.back(),
            child: Container(
              margin: EdgeInsets.only(left: 12),
              width: 45,
              height: 45,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.lightGreyColor
              ),
              child: Icon(Icons.arrow_forward_ios),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              GetBuilder<RegisterController>(
                init: RegisterController(),
                  builder: (controller) {
                    return controller.userImage == null
                      ? GestureDetector(
                          onTap: () {
                            Get.bottomSheet(
                                backgroundColor: Colors.white,
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 12.0, horizontal: 20),
                                  child: Column(
                                    spacing: 16,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          Get.back();
                                          controller.takePhoto(source: ImageSource.camera);
                                        },
                                        child: Row(
                                          spacing: 16,
                                          children: [
                                            Icon(
                                              Icons.camera_alt_outlined,
                                              color: context
                                                  .theme.colorScheme.primary,
                                            ),
                                            Text(
                                              AppStrings.takeNewPhoto,
                                              style: GoogleFonts.vazirmatn(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w700),
                                            )
                                          ],
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          Get.back();
                                          controller.takePhoto(source: ImageSource.gallery);
                                          },
                                        child: Row(
                                          spacing: 16,
                                          children: [
                                            Icon(
                                              Icons.image,
                                              color: context
                                                  .theme.colorScheme.primary,
                                            ),
                                            Text(
                                              AppStrings.getPhotoFromGallery,
                                              style: GoogleFonts.vazirmatn(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w700),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ));
                          },
                          child: Container(
                            width: 120,
                            height: 120,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.lightGreyColor),
                            child: Icon(
                              Icons.camera_alt_outlined,
                              size: 64,
                              color: context.theme.colorScheme.primary,
                            ),
                          ),
                        )
                      : SizedBox(
                        width: 120,
                        height: 120,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(1000),
                            child: Image.file(
                              File(controller.userImage!.path),
                              fit: BoxFit.cover,)));
                },
              ),
              GetBuilder<RegisterController>(
                  builder: (controller) {
                    return Column(
                      children: [
                        CustomTextField(
                          controller: controller.firstnameTxtController,
                          label: "نام شما",
                          hintTxt: AppStrings.usernameExampleHint,
                        ),
                        SizedBox(height: 16),
                        CustomTextField(
                          controller: controller.lastnameTxtController,
                          label: AppStrings.fullName,
                          hintTxt: AppStrings.fullNameExampleHint,
                        ),
                        SizedBox(height: 16),
                        CustomTextField(
                          controller: controller.emailTxtController,
                          label: AppStrings.email,
                          hintTxt: AppStrings.emailExampleHint,
                        ),
                        SizedBox(height: 16),
                        CustomTextField(
                          controller: controller.passwordTxtController,
                          label: AppStrings.password,
                          hintTxt: AppStrings.passwordHint,
                          inputType: TextInputType.visiblePassword,
                        ),
                        SizedBox(height: 16),
                        CustomTextField(
                          controller: controller.repeatPasswordTxtController,
                          label: AppStrings.repeatPassWord,
                          hintTxt: AppStrings.passwordHint,
                          inputType: TextInputType.visiblePassword,
                        ),
                      ],
                    );
                  },
              )
            ],
          ),
        ),
      ),
    );
  }
}
