import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:nova_blog_mobile/core/services/web_service.dart';
import 'package:nova_blog_mobile/models/comment_model.dart';

class CommentController  extends GetxController {
  CommentController({required this.id});
  final int id;
  
  List<CommentModel>? comments;
  final WebService _webService = WebService();
  final TextEditingController commentTxt = TextEditingController();
  bool isSendCommentLoading = false;
  
  Future<void> getAllComments() async {
    final response = await _webService.getRequest(endPoint: "/comments/get/$id",token: await _getToken());

    if(response.statusCode == 200) {
      final List<CommentModel> apiCommentList = [];
      for(var comment in response.data["data"]) {
        apiCommentList.add(CommentModel.fromJson(comment));
      }
      comments = apiCommentList;
      update();
    }
  }

  Future<void> createComment() async {
    final Map<String,dynamic> body = {
      "comment" : commentTxt.text
    };
    isSendCommentLoading = true;
    update();
    final response = await _webService.postRequest(endPoint: "/comments/store/$id",body: body,token: await _getToken());
    isSendCommentLoading = false;
    update();

    if(response.statusCode == 201) {
      commentTxt.clear();
      Get.snackbar("عملیات موفق", "کامنت شما بعد از تایید مدیریت نمایش داده میشود",backgroundColor: Colors.green);
    } else {
      final errorMessage = response.data["message"];
      Get.snackbar("خطا", errorMessage,backgroundColor: Colors.red);
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
    getAllComments();
  }
}