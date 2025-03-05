import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nova_blog_mobile/controllers/single_post_controller.dart';
import 'package:nova_blog_mobile/core/constants/app_colors.dart';
import 'package:nova_blog_mobile/core/widgets/custom_load_net_work_widget.dart';
import 'package:nova_blog_mobile/views/comments_view.dart';

class SinglePostView extends StatelessWidget {
  const SinglePostView({super.key, required this.id});
  final int id;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SinglePostController>(
        init: SinglePostController(id: id),
        builder: (controller) {
          return Scaffold(
            floatingActionButton: FloatingActionButton(
              backgroundColor: AppColors.primaryColor,
              onPressed: () {Get.to(CommentsView(id: id));},
              child: Icon(CupertinoIcons.chat_bubble_2,color: Colors.white,),),
            body: controller.post == null ? Center(
              child: CircularProgressIndicator(),
            ) : Padding(
              padding: const EdgeInsets.all(20.0),
              child: SafeArea(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      CustomLoadNetWorkWidget(
                          imageUrl: controller.post!.image!,
                          imageWidth: double.infinity,
                        imageHeight: 300,
                      ),
                      SizedBox(height: 16.0),
                      Text(controller.post!.title!,style: GoogleFonts.vazirmatn(fontSize: 16,fontWeight: FontWeight.bold)),
                  
                      SizedBox(height: 16.0),
                  
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              CustomLoadNetWorkWidget(
                                  imageUrl: controller.post!.author!.avatar!,
                                imageWidth: 45,
                                imageHeight: 45,
                                radius: 1000,
                              ),
                              SizedBox(width: 8.0,),
                              Text(controller.post!.author!.fullName!,style: GoogleFonts.vazirmatn(fontSize: 12,color: AppColors.greyColor)),
                  
                            ],
                          ),
                  
                          IconButton(
                              onPressed: () => controller.likeProcess ? (){} : controller.likeOrDisLike(),
                              icon: controller.likeProcess? CircularProgressIndicator() : Icon(
                                  controller.post!.isLiked! ? CupertinoIcons.heart_fill : CupertinoIcons.heart ,
                                color: controller.post!.isLiked! ? Colors.red : Colors.grey,
                              )
                          )
                        ],
                      ),

                      SizedBox(height: 12,),
                      
                      Text(
                          controller.post!.content!,
                          style: GoogleFonts.vazirmatn(fontSize: 12,color: Colors.grey),
                        textAlign: TextAlign.justify,
                      ),
                      SizedBox(height: 64,),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
    );
  }
}
