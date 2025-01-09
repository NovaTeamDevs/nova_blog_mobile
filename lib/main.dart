import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nova_blog_mobile/core/constants/app_colors.dart';
import 'package:nova_blog_mobile/views/splash_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'NovaBlog',
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.scaffoldColor,
        colorScheme: ColorScheme.light(
          primary: AppColors.primaryColor,
          primaryContainer: AppColors.whiteColor,
          error: AppColors.readColor
        ),
        useMaterial3: true,
      ),
    locale: Locale("fa"),
    home: SplashView(),
    );
  }
}

