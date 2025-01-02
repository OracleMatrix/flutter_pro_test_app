import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pro_test_app/app/data/Models/get_all_products_model.dart';

class GetAllProductsApiService extends GetConnect {
  Future<GetAllProductsModel?> getAllProducts() async {
    try {
      final response = await get('https://dummyjson.com/products');
      if (response.status.isOk) {
        return getAllProductsModelFromJson(response.bodyString!);
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
