import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nova_blog_mobile/core/constants/app_colors.dart';
import 'package:nova_blog_mobile/core/constants/app_strings.dart';
import 'package:nova_blog_mobile/core/widgets/custom_button_widget.dart';
import 'package:nova_blog_mobile/core/widgets/custom_text_field.dart';
import 'package:nova_blog_mobile/views/main_view.dart';
import 'package:nova_blog_mobile/views/register_view.dart';

class AuthView extends StatelessWidget {
  const AuthView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/png/logo.png"),
              SizedBox(height: 32.0,),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16.0,vertical: 32.0),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: context.theme.colorScheme.primaryContainer,
                  borderRadius: BorderRadius.circular(12.0),
                  boxShadow: [
                    BoxShadow(color: Colors.black.withValues(alpha: 0.15),blurRadius: 30)
                  ]
                ),
                child: Column(
                  children: [
                    Text(AppStrings.welcomeMessage,style: GoogleFonts.vazirmatn(fontSize: 24,color: Colors.black,fontWeight: FontWeight.bold),),
                    SizedBox(height: 24.0,),
                    CustomTextField(
                        label: AppStrings.username,
                        hintTxt: AppStrings.usernameHint,
                        controller: TextEditingController()
                    ),
                    SizedBox(height: 12.0,),
                    CustomTextField(
                      inputType: TextInputType.visiblePassword,
                        label: AppStrings.password,
                        hintTxt: AppStrings.passwordHint,
                        controller: TextEditingController()
                    ),
                    SizedBox(height: 32.0,),

                    CustomButtonWidget(onTap: () {
                      Get.to(MainView());
                    }, txt: AppStrings.login),
                    SizedBox(height: 12.0,),
                    CustomButtonWidget(
                        onTap: () {
                          Get.to(RegisterView());
                        },
                        bgColor: AppColors.readColor,
                        txt: AppStrings.createAccount),
                  ],
                ),
              )
            ],
          )
        ),
      ),
    );
  }
}
