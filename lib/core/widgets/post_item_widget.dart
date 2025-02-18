import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nova_blog_mobile/core/constants/app_colors.dart';
import 'package:nova_blog_mobile/core/widgets/custom_load_net_work_widget.dart';
import 'package:nova_blog_mobile/models/post_model.dart';

class PostItemWidget extends StatelessWidget {
  const PostItemWidget({
    super.key, required this.post,
  });
  final PostModel post;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(bottom: 24),
      child: Row(
        spacing: 16.0,
        children: [
          CustomLoadNetWorkWidget(
              imageWidth: 120,
              imageHeight: 120,
              imageUrl: post.image!),
          Column(
            spacing: 8.0,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 230,
                child: Text(
                  post.title ?? "",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.vazirmatn(fontSize: 16.0,fontWeight: FontWeight.bold),),
              ),
              Text("نویسنده : ${post.author?.fullName}",style: GoogleFonts.vazirmatn(fontSize: 12,color: AppColors.greyColor),),
              Text("دسته بندی : ${post.category?.name}",style: GoogleFonts.vazirmatn(fontSize: 12,color: AppColors.greyColor),)
            ],
          )
        ],
      ),
    );
  }
}