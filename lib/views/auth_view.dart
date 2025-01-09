import 'package:flutter/material.dart';
import 'package:nova_blog_mobile/core/constants/app_colors.dart';
import 'package:nova_blog_mobile/core/widgets/custom_button_widget.dart';
import 'package:nova_blog_mobile/core/widgets/custom_text_field.dart';

class AuthView extends StatelessWidget {
  const AuthView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: CustomTextField(
          controller: TextEditingController(),
          label: "نام کاربری",
          hintTxt: "لطفا نام کاربری خود را وارد کنید",
        )
      )),
    );
  }
}
