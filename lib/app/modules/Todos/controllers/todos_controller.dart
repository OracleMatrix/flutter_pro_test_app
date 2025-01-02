import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pro_test_app/app/data/Models/get_all_todos_model.dart';
import 'package:pro_test_app/app/data/Services/Todos/get_all_todos_api_service.dart';

class TodosController extends GetxController {
  final GetAllTodosApiService _apiService = GetAllTodosApiService();
  var allData = GetAllTodosModel().obs;
  var _isLoading = false.obs;
  get isLoading => _isLoading.value;

  set isLoading(var value) => _isLoading = value;

  Future<GetAllTodosModel?> fetchPosts() async {
    try {
      _isLoading.value = true;
      final data = await _apiService.getAllTodos();
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
