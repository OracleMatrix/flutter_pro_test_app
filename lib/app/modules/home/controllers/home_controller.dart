import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pro_test_app/app/data/Models/get_all_products_model.dart';
import 'package:pro_test_app/app/data/Services/Products/get_all_products_api_service.dart';

class HomeController extends GetxController {
  final GetAllProductsApiService _apiService = GetAllProductsApiService();
  var allData = GetAllProductsModel().obs;
  var _isLoading = false.obs;
  get isLoading => _isLoading.value;

  set isLoading(var value) => _isLoading = value;

  Future<GetAllProductsModel?> fetchProducts() async {
    try {
      _isLoading.value = true;
      final data = await _apiService.getAllProducts();
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
