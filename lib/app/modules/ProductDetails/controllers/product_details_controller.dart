import 'package:get/get.dart';
import 'package:pro_test_app/app/data/Models/get_all_products_model.dart'; // Import the Product model

class ProductDetailsController extends GetxController {
  late Product product;

  @override
  void onInit() {
    super.onInit();
    // Retrieve the arguments
    final arguments = Get.arguments as Map<String, dynamic>;
    product = arguments['detail'];
  }
}
