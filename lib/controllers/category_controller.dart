import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nova_blog_mobile/core/services/web_service.dart';
import 'package:nova_blog_mobile/models/category_model.dart';

class CategoryController extends GetxController {
  List<CategoryModel>? categories;
  final WebService _webService = WebService();

  Future<void> getAllCategories({int? page,int?perPage}) async {
    final Map<String,dynamic> params = {
      if(page != null)
        "page" : page,
      if(perPage != null)
        "per_page" : perPage
    };
    final response = await _webService.getRequest(endPoint: "/categories",params: params);
    if(response.statusCode == 200 && response.data["data"] != null) {
      final List<CategoryModel> categoriesApi = [];
      for(var category in response.data["data"]) {
        categoriesApi.add(CategoryModel.fromJson(category));
      }
      categories = categoriesApi;
      update();
    } else {
      final errorMessage = response.data["message"];
      Get.snackbar("خطا", errorMessage,backgroundColor: Colors.red);
    }
  }

  @override
  void onInit() {
    super.onInit();
    getAllCategories();
  }
}