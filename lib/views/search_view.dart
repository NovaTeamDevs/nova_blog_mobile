import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nova_blog_mobile/controllers/search_post_controller.dart';
import 'package:nova_blog_mobile/core/constants/app_colors.dart';
import 'package:nova_blog_mobile/core/widgets/custom_text_field.dart';
import 'package:nova_blog_mobile/core/widgets/post_item_widget.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: GetBuilder<SearchPostController>(
        init: SearchPostController(),
          builder: (controller) {
            return controller.postList == null ? Center(child: CircularProgressIndicator(color: AppColors.primaryColor)) 
                : Column(
              children: [
                CustomTextField(
                  label: "",
                  hintTxt: "عنوان مقاله را وارد کنید",
                  controller: controller.searchTxtController,
                  onChange: (value) async {
                    await Future.delayed(Duration(seconds: 2));
                    controller.getSearchPost(searchKeyWord: value);
                  },
                ),
                SizedBox(height: 32),
                Expanded(
                    child: ListView.builder(
                        itemCount: controller.postList!.length,
                        itemBuilder: (context, index) => PostItemWidget(post: controller.postList![index]),
                    ),
                )
              ],
            );
          },
      )
    );
  }
}
