import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:nova_blog_mobile/core/constants/app_colors.dart';
import 'package:nova_blog_mobile/core/services/web_service.dart';
import 'package:nova_blog_mobile/models/post_model.dart';

class SinglePostController extends GetxController {
  SinglePostController({required this.id});
  final int id;
  final WebService _webService = WebService();
  PostModel? post;
  bool likeProcess = false;
  
  Future<void> getPost() async {
    final response = await _webService.getRequest(endPoint: "/post/$id",token: await _getToken());
    
    if(response.statusCode == 200) {
      post = PostModel.fromJson(response.data["data"]);
      update();
    } else {
      Get.back();
      final errorMessage = response.data["message"];
      Get.snackbar("خطا", errorMessage,backgroundColor: AppColors.readColor);
    }
  }

  Future<void> likeOrDisLike() async {
    likeProcess = true;
    update();
    final response = await _webService.postRequest(endPoint: "/post/like-dislike/$id",token: await _getToken());
    likeProcess = false;
    update();
    if(response.statusCode == 200) {
      post!.isLiked = !post!.isLiked!;
      update();
    } else {
      final errorMessage = response.data["message"];
      Get.snackbar("خطا", errorMessage,backgroundColor: AppColors.readColor);
    }
  }

  Future<String?> _getToken() async {
    final FlutterSecureStorage secureStorage = FlutterSecureStorage();
    final token = await secureStorage.read(key: "token");
    return token;
  }

  @override
  void onInit() {
    super.onInit();
    getPost();
  }
    
}