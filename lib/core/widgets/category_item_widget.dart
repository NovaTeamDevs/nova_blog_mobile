import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nova_blog_mobile/core/constants/app_colors.dart';
import 'package:nova_blog_mobile/models/category_model.dart';

class CategoryItemWidget extends StatelessWidget {
  const CategoryItemWidget({
    super.key, required this.category,
  });
  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 18),
      decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(12)
      ),
      child: ListTile(
        title: Text(category.name ?? "بدون نام",style: GoogleFonts.vazirmatn(fontSize: 16,fontWeight: FontWeight.bold)),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Text(category.description ?? "بدون توضیحات",style: GoogleFonts.vazirmatn(fontSize: 12,color: AppColors.greyColor)),
        ),
      ),
    );
  }
}
