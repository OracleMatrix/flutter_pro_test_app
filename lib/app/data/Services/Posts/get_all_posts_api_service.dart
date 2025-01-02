import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pro_test_app/app/data/Models/get_all_posts_model.dart';

class GetAllPostsApiService extends GetConnect {
  Future<GetAllPostsModel?> getAllPosts() async {
    try {
      final response = await get('https://dummyjson.com/posts');
      if (response.status.isOk) {
        return getAllPostsModelFromJson(response.bodyString!);
      } else if (response.status.hasError) {
        Get.snackbar('Error', response.body['message'] ?? response.statusText,
            colorText: Colors.red);
      } else if (response.status.isServerError) {
        Get.snackbar('Error', "Server Error", colorText: Colors.red);
      } else if (response.status.isNotFound) {
        Get.snackbar('Error', "Not Found", colorText: Colors.red);
      } else {
        Get.snackbar('Error', "Something went wrong\nPlease try again",
            colorText: Colors.red);
      }
    } catch (e) {
      rethrow;
    }
    return null;
  }
}
