import 'package:get/get.dart';

import '../modules/Catagory_Page/bindings/catagory_page_binding.dart';
import '../modules/Catagory_Page/views/catagory_page_view.dart';
import '../modules/OTP_screen/bindings/o_t_p_screen_binding.dart';
import '../modules/OTP_screen/views/o_t_p_screen_view.dart';
import '../modules/email_screen/bindings/email_screen_binding.dart';
import '../modules/email_screen/views/email_screen_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login_screen/bindings/login_screen_binding.dart';
import '../modules/login_screen/views/login_screen_view.dart';
import '../modules/singup_screen/bindings/singup_screen_binding.dart';
import '../modules/singup_screen/views/singup_screen_view.dart';
import '../modules/view-product/bindings/view_product_binding.dart';
import '../modules/view-product/views/view_product_view.dart';

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
      name: _Paths.LOGIN_SCREEN,
      page: () => LoginScreenView(),
      binding: LoginScreenBinding(),
    ),
    GetPage(
      name: _Paths.SINGUP_SCREEN,
      page: () => const SingupScreenView(),
      binding: SingupScreenBinding(),
    ),
    GetPage(
      name: _Paths.O_T_P_SCREEN,
      page: () => const OTPScreenView(),
      binding: OTPScreenBinding(),
    ),
    GetPage(
      name: _Paths.EMAIL_SCREEN,
      page: () => const EmailScreenView(),
      binding: EmailScreenBinding(),
    ),
    // GetPage(
    //   name: _Paths.VIEW_PRODUCT,
    //   page: () =>  ViewProductView(),
    //   binding: ViewProductBinding(),
    // ),
    GetPage(
      name: _Paths.CATAGORY_PAGE,
      page: () => CatagoryPageView(),
      binding: CatagoryPageBinding(),
    ),
  ];
}
