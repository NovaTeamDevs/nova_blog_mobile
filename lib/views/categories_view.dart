import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nova_blog_mobile/controllers/category_controller.dart';
import 'package:nova_blog_mobile/core/widgets/category_item_widget.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: GetBuilder<CategoryController>(
            init: CategoryController(),
            builder: (controller) {
              return controller.categories == null ?
              Center(child: CircularProgressIndicator())
              : ListView.builder(
                  itemCount: controller.categories!.length,
                  itemBuilder: (context, index) => CategoryItemWidget(category: controller.categories![index]),
              );    
            },
        )
      ),
    );
  }
}

