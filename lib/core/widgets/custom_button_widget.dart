import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nova_blog_mobile/core/constants/app_colors.dart';

class CustomButtonWidget extends StatelessWidget {
  const CustomButtonWidget({
    super.key,
    this.bgColor = AppColors.primaryColor,
     this.width = double.infinity,
     this.height = 48.0,
     this.radius = 12.0,
    this.isLoading = false,
    required this.onTap,
    required this.txt
  });
  final Color bgColor;
  final double width,height,radius;
  final VoidCallback onTap;
  final String txt;
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius)
          )
        ),
        backgroundColor: WidgetStatePropertyAll(bgColor),
        minimumSize: WidgetStatePropertyAll(Size(width,height))
      ),
        onPressed: isLoading? (){}  : onTap,
        child: isLoading? Padding(
          padding: const EdgeInsets.all(12.0),
          child: CircularProgressIndicator(color: Colors.white,),
        ) : Text(txt,style: GoogleFonts.vazirmatn(fontSize: 14,fontWeight: FontWeight.bold,color: AppColors.whiteColor),));
  }
}
