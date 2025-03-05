import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nova_blog_mobile/controllers/comment_controller.dart';
import 'package:nova_blog_mobile/core/widgets/custom_button_widget.dart';
import 'package:nova_blog_mobile/core/widgets/custom_text_field.dart';

class CommentsView extends StatelessWidget {
  const CommentsView({super.key, required this.id});
  final int id;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CommentController>(
        init: CommentController(id: id),
        builder: (controller) {
          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: controller.comments == null ?
              Center(child: CircularProgressIndicator())
                  : Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          itemCount: controller.comments!.length,
                            itemBuilder:  (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(12)
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      spacing: 12,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(controller.comments![index].fullName ?? "کاربر مهمان",style: GoogleFonts.vazirmatn(fontSize: 14,color: Colors.grey),),
                                        Text(controller.comments![index].comment ?? "",style: GoogleFonts.vazirmatn(fontSize: 12),)
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                        ),
                      ),

                      CustomTextField(label: "", hintTxt: "متن نظر خود را وارد کنید",maxLines: 4,controller: controller.commentTxt),
                      SizedBox(height: 16),
                      CustomButtonWidget(
                          onTap: () {
                            if(controller.commentTxt.text.isNotEmpty) {
                              controller.createComment();
                            } else {
                              Get.snackbar("خطا", "لطفا یک متن برای نظر خود وارد کنید!",backgroundColor: Colors.red);
                            }

                      },
                          txt: "ارسال نظر",isLoading: controller.isSendCommentLoading)
                    ],
              ),
            ),
          );
        },
    );
  }
}
