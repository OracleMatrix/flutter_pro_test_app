import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pro_test_app/app/data/Models/get_all_todos_model.dart';

class GetAllTodosApiService extends GetConnect {
  Future<GetAllTodosModel?> getAllTodos() async {
    try {
      final response = await get('https://dummyjson.com/todos');
      if (response.status.isOk) {
        return getAllTodosModelFromJson(response.bodyString!);
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
