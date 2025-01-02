import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginUserApiService extends GetConnect {
  Future loginUser(String email, String password) async {
    try {
      final response = await post(
        'https://dummyjson.com/user/login',
        {'email': email, 'password': password},
      );
      if (response.status.isOk) {
        return response.body;
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
  }
}
