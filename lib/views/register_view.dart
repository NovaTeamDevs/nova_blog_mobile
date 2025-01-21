import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nova_blog_mobile/core/constants/app_colors.dart';
import 'package:nova_blog_mobile/core/constants/app_strings.dart';
import 'package:nova_blog_mobile/core/widgets/custom_button_widget.dart';
import 'package:nova_blog_mobile/core/widgets/custom_text_field.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20.0),
        child: CustomButtonWidget(onTap: () {}, txt: AppStrings.createAccount),
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
              Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.lightGreyColor
                ),
                child: Icon(Icons.camera_alt_outlined,size: 64,color: context.theme.colorScheme.primary,),
              ),
              CustomTextField(
                label: AppStrings.username,
                hintTxt: AppStrings.usernameExampleHint,
              ),
              SizedBox(height: 16),
              CustomTextField(
                label: AppStrings.fullName,
                hintTxt: AppStrings.fullNameExampleHint,
              ),
              SizedBox(height: 16),
              CustomTextField(
                label: AppStrings.email,
                hintTxt: AppStrings.emailExampleHint,
              ),
              SizedBox(height: 16),
              CustomTextField(
                label: AppStrings.password,
                hintTxt: AppStrings.passwordHint,
                inputType: TextInputType.visiblePassword,
              ),
              SizedBox(height: 16),
              CustomTextField(
                label: AppStrings.repeatPassWord,
                hintTxt: AppStrings.passwordHint,
                inputType: TextInputType.visiblePassword,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
