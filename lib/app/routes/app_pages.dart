import 'package:get/get.dart';

import 'package:farmer_app/app/modules/buy_input/bindings/buy_input_binding.dart';
import 'package:farmer_app/app/modules/buy_input/views/buy_input_view.dart';
import 'package:farmer_app/app/modules/crop_manual/bindings/crop_manual_binding.dart';
import 'package:farmer_app/app/modules/crop_manual/views/crop_manual_view.dart';
import 'package:farmer_app/app/modules/disease_detection/bindings/disease_detection_binding.dart';
import 'package:farmer_app/app/modules/disease_detection/views/disease_detection_view.dart';
import 'package:farmer_app/app/modules/home/bindings/home_binding.dart';
import 'package:farmer_app/app/modules/home/views/home_view.dart';
import 'package:farmer_app/app/modules/launch_screen/bindings/launch_screen_binding.dart';
import 'package:farmer_app/app/modules/launch_screen/views/welcome_view.dart';
import 'package:farmer_app/app/modules/login/bindings/login_binding.dart';
import 'package:farmer_app/app/modules/login/views/login_view.dart';
import 'package:farmer_app/app/modules/paddy_straw_management/bindings/paddy_straw_management_binding.dart';
import 'package:farmer_app/app/modules/paddy_straw_management/views/paddy_straw_management_view.dart';
import 'package:farmer_app/app/modules/register/bindings/register_binding.dart';
import 'package:farmer_app/app/modules/register/views/register_view.dart';
import 'package:farmer_app/app/modules/sell_produce/bindings/sell_produce_binding.dart';
import 'package:farmer_app/app/modules/sell_produce/views/sell_produce_view.dart';
import 'package:farmer_app/app/modules/startup/bindings/startup_binding.dart';
import 'package:farmer_app/app/modules/startup/views/startup_view.dart';
import 'package:farmer_app/app/modules/weather_report/bindings/weather_report_binding.dart';
import 'package:farmer_app/app/modules/weather_report/views/weather_report_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.STARTUP;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),

    ///Welcome Screen
    GetPage(
      name: _Paths.WELCOME,
      page: () => WelcomeScreen(),
      binding: LaunchScreenBinding(),
    ),

    GetPage(
      name: _Paths.WEATHER_REPORT,
      page: () => WeatherReportView(),
      binding: WeatherReportBinding(),
    ),
    GetPage(
      name: _Paths.DISEASE_DETECTION,
      page: () => DiseaseDetectionView(),
      binding: DiseaseDetectionBinding(),
    ),
    GetPage(
      name: _Paths.CROP_MANUAL,
      page: () => CropManualView(),
      binding: CropManualBinding(),
    ),
    GetPage(
      name: _Paths.PADDY_STRAW_MANAGEMENT,
      page: () => PaddyStrawManagementView(),
      binding: PaddyStrawManagementBinding(),
    ),

    ///STARTUP

    GetPage(
      name: _Paths.STARTUP,
      page: () => StartupView(),
      binding: StartupBinding(),
    ),

    ///Auth
    GetPage(
      name: _Paths.REGISTER,
      page: () => RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.BUY_INPUT,
      page: () => BuyInputView(),
      binding: BuyInputBinding(),
    ),
    GetPage(
      name: _Paths.SELL_PRODUCE,
      page: () => SellProduceView(),
      binding: SellProduceBinding(),
    ),
  ];
}
