import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pro_test_app/app/data/Services/Authentication/login_user_api_service.dart';
import 'package:pro_test_app/app/routes/app_pages.dart';

class AuthenticationController extends GetxController {
  final LoginUserApiService _apiService = LoginUserApiService();
  var _isLoading = false.obs;
  get isLoading => _isLoading.value;

  set isLoading(var value) => _isLoading = value;
  final email = ''.obs;
  final password = ''.obs;
  final isPasswordVisible = false.obs;

  void togglePasswordVisibility() {
    isPasswordVisible.toggle();
  }

  bool validateForm() {
    if (email.isEmpty || password.isEmpty) {
      Get.snackbar('Error', 'Please fill in all fields', colorText: Colors.red);
      return false;
    }
    // if (!GetUtils.isEmail(email.value)) {
    //   Get.snackbar('Error', 'Please enter a valid email');
    //   return false;
    // }
    if (password.value.length < 6) {
      Get.snackbar('Error', 'Password must be at least 6 characters',
          colorText: Colors.red);
      return false;
    }
    return true;
  }

  Future loginUser(String email, String password) async {
    try {
      _isLoading.value = true;
      final data = await _apiService.loginUser(email, password);
      if (data != null) {
        Get.offAllNamed(Routes.HOME);
        Get.snackbar('Success', 'Login Successful', colorText: Colors.green);
        return data;
      }
    } catch (error) {
      Get.snackbar('Error', error.toString(), colorText: Colors.red);
    } finally {
      _isLoading.value = false;
    }
  }
}
