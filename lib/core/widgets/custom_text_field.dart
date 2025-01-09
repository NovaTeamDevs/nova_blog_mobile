import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nova_blog_mobile/core/constants/app_colors.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key, required this.label, required this.hintTxt, required this.controller});
  final String label,hintTxt;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,style: GoogleFonts.vazirmatn(color: Colors.black,fontSize: 14,fontWeight: FontWeight.bold),),
        SizedBox(height: 12.0,),
        TextFormField(
          controller: controller,
          decoration: InputDecoration(
            filled: true,
            hintText: hintTxt,
            hintStyle: GoogleFonts.vazirmatn(fontSize: 14,color: AppColors.greyColor),
            fillColor: AppColors.greyTextFieldColor,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.greyBorderColor),
              borderRadius: BorderRadius.circular(12.0)
            ),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: context.theme.colorScheme.primary),
                borderRadius: BorderRadius.circular(12.0)
            )
          ),
        ),
      ],
    );
  }
}
