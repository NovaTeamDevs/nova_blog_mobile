import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nova_blog_mobile/core/constants/app_colors.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key, required this.label, required this.hintTxt,this.controller,this.inputType = TextInputType.text, this.onChange,this.maxLines = 1});
  final String label,hintTxt;
  final TextEditingController? controller;
  final TextInputType inputType;
  final Function(String value)? onChange;
  final int maxLines;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,style: GoogleFonts.vazirmatn(color: Colors.black,fontSize: 14,fontWeight: FontWeight.bold),),
        SizedBox(height: 12.0,),
        TextFormField(
          maxLines: maxLines,
          obscureText: inputType == TextInputType.visiblePassword,
          keyboardType: inputType,
          controller: controller,
          onChanged: onChange,
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
