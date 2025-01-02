import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/authentication_controller.dart';

class AuthenticationView extends GetView<AuthenticationController> {
  const AuthenticationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.blue.shade400, Colors.purple.shade400],
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20.0),
            child: Card(
              elevation: 8.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Welcome Back!',
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue.shade800,
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    _buildEmailField(),
                    const SizedBox(height: 16.0),
                    _buildPasswordField(),
                    const SizedBox(height: 24.0),
                    _buildLoginButton(),
                    const SizedBox(height: 16.0),
                    TextButton(
                      onPressed: () {
                        // Navigate to signup or forgot password
                        Get.snackbar(
                          'Info',
                          'Forgot Password? Feature coming soon!',
                          snackPosition: SnackPosition.BOTTOM,
                        );
                      },
                      child: Text(
                        'Forgot Password?',
                        style: TextStyle(
                          color: Colors.blue.shade600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildEmailField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Email',
        prefixIcon: Icon(Icons.email, color: Colors.blue.shade600),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blue.shade600, width: 2.0),
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      keyboardType: TextInputType.emailAddress,
      onChanged: (value) => controller.email.value = value,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your email';
        }
        // if (!GetUtils.isEmail(value)) {
        //   return 'Please enter a valid email';
        // }
        return null;
      },
    );
  }

  Widget _buildPasswordField() {
    return Obx(() {
      return TextFormField(
        decoration: InputDecoration(
          labelText: 'Password',
          prefixIcon: Icon(Icons.lock, color: Colors.blue.shade600),
          suffixIcon: IconButton(
            icon: Icon(
              controller.isPasswordVisible.value
                  ? Icons.visibility
                  : Icons.visibility_off,
              color: Colors.blue.shade600,
            ),
            onPressed: () {
              controller.togglePasswordVisibility();
            },
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue.shade600, width: 2.0),
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        obscureText: !controller.isPasswordVisible.value,
        onChanged: (value) => controller.password.value = value,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter your password';
          }
          if (value.length < 6) {
            return 'Password must be at least 6 characters';
          }
          return null;
        },
      );
    });
  }

  Widget _buildLoginButton() {
    return Obx(() {
      return ElevatedButton(
        onPressed: controller.isLoading
            ? null
            : () async {
                if (controller.validateForm()) {
                  await controller.loginUser(
                      controller.email.value, controller.password.value);
                }
              },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue.shade600,
          padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 12.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        child: controller.isLoading
            ? const CircularProgressIndicator(color: Colors.white)
            : Text(
                'Login',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
      );
    });
  }
}
