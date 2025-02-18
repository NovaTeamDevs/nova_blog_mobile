import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:nova_blog_mobile/core/constants/app_colors.dart';
import 'package:nova_blog_mobile/core/services/web_service.dart';
import 'package:nova_blog_mobile/models/post_model.dart';

class HomeController extends GetxController {
  final WebService _webService = WebService();
  int selectedSliderIndex = 0;
  List<PostModel>? postList;

  void updateSliderIndicator(int newIndex) {
    selectedSliderIndex = newIndex;
    update();
  }

  Future<void> getHomePost({int? perPage,int? page}) async {
    final Map<String,dynamic> params = {
      if(page != null)
        "page" : page,
      if(perPage != null)
        "per_page" : perPage
    };
    final FlutterSecureStorage secureStorage = FlutterSecureStorage();
    final String? token = await secureStorage.read(key: "token");
    final response = await _webService.getRequest(endPoint: "/posts",params: params,token: token);

    if(response.statusCode == 200 && response.data["data"] != null) {
      final List<PostModel> posts = [];
      for(var post in response.data["data"]) {
        posts.add(PostModel.fromJson(post));
      }
      postList = posts;
      update();
    } else {
      final errorMessage = response.data["message"];
      Get.snackbar("خطا", errorMessage,backgroundColor: AppColors.readColor);
    }

  }

  @override
  void onInit() {
    getHomePost();
    super.onInit();
  }

}