import 'package:get/get.dart';

import '../modules/ProductDetails/bindings/product_details_binding.dart';
import '../modules/ProductDetails/views/product_details_view.dart';
import '../modules/SocialMedia/bindings/social_media_binding.dart';
import '../modules/SocialMedia/views/social_media_view.dart';
import '../modules/Todos/bindings/todos_binding.dart';
import '../modules/Todos/views/todos_view.dart';
import '../modules/authentication/bindings/authentication_binding.dart';
import '../modules/authentication/views/authentication_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';

// ignore_for_file: constant_identifier_names

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.AUTHENTICATION,
      page: () => const AuthenticationView(),
      binding: AuthenticationBinding(),
    ),
    GetPage(
      name: _Paths.PRODUCT_DETAILS,
      page: () => const ProductDetailsView(),
      binding: ProductDetailsBinding(),
    ),
    GetPage(
      name: _Paths.SOCIAL_MEDIA,
      page: () => const SocialMediaView(),
      binding: SocialMediaBinding(),
    ),
    GetPage(
      name: _Paths.TODOS,
      page: () => const TodosView(),
      binding: TodosBinding(),
    ),
  ];
}
