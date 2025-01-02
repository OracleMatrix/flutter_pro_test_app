import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pro_test_app/app/data/Models/get_all_posts_model.dart';
import 'package:pro_test_app/app/data/Services/Posts/get_all_posts_api_service.dart';

class SocialMediaController extends GetxController {
  final GetAllPostsApiService _apiService = GetAllPostsApiService();
  var allData = GetAllPostsModel().obs;
  var _isLoading = false.obs;
  get isLoading => _isLoading.value;

  set isLoading(var value) => _isLoading = value;

  Future<GetAllPostsModel?> fetchPosts() async {
    try {
      _isLoading.value = true;
      final data = await _apiService.getAllPosts();
      if (data != null) {
        allData.value = data;
        return data;
      }
    } catch (error) {
      Get.snackbar('Error', error.toString(), colorText: Colors.red);
    } finally {
      _isLoading.value = false;
    }
    return null;
  }
}
