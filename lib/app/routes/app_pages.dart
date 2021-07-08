import 'package:farmer_app/app/modules/authentication/views/auth_view.dart';
import 'package:farmer_app/app/modules/authentication/views/enter_name_view.dart';
import 'package:farmer_app/app/modules/authentication/views/otp_view.dart';
import 'package:farmer_app/app/modules/authentication/bindings/authentication_binding.dart';

import 'package:farmer_app/app/modules/home/views/create_post_view.dart';
import 'package:farmer_app/app/modules/home/views/notifications_view.dart';
import 'package:farmer_app/app/modules/home/views/home_view.dart';
import 'package:farmer_app/app/modules/home/bindings/home_binding.dart';

import 'package:farmer_app/app/modules/launch_screen/views/app_entry_view.dart';
import 'package:farmer_app/app/modules/launch_screen/views/get_started_view.dart';
import 'package:farmer_app/app/modules/launch_screen/views/language_selection_view.dart';
import 'package:farmer_app/app/modules/launch_screen/views/welcome_view.dart';
import 'package:farmer_app/app/modules/launch_screen/bindings/launch_screen_binding.dart';

import 'package:farmer_app/app/modules/profile/views/edit_profile_view.dart';
import 'package:farmer_app/app/modules/profile/views/profile_view.dart';
import 'package:farmer_app/app/modules/profile/bindings/profile_binding.dart';

import 'package:get/get.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.APP_ENTRY;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.CREATE_POST,
      page: () => CreatePostView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.NOTIFICATIONS,
      page: () => NotificationsView(),
      binding: HomeBinding(),
    ),

    ///AUTH
    GetPage(
      name: _Paths.AUTHENTICATION,
      page: () => AuthView(),
      binding: AuthenticationBinding(),
    ),
    GetPage(
      name: _Paths.ENTER_NAME,
      page: () => EnterNameView(),
      binding: AuthenticationBinding(),
    ),
    GetPage(
      name: _Paths.OTP,
      page: () => OtpView(),
      binding: AuthenticationBinding(),
    ),

    ///STARTUP
    GetPage(
      name: _Paths.APP_ENTRY,
      page: () => AppEntryView(),
      binding: LaunchScreenBinding(),
    ),
    GetPage(
      name: _Paths.GET_STARTED,
      page: () => GetStartedView(),
      binding: LaunchScreenBinding(),
    ),
    GetPage(
      name: _Paths.LANGUAGE_SELECTION,
      page: () => LanguageSelectionView(),
      binding: LaunchScreenBinding(),
    ),
    GetPage(
      name: _Paths.WELCOME,
      page: () => WelcomeScreen(),
      binding: LaunchScreenBinding(),
    ),

    ///PROFILE
    GetPage(
      name: _Paths.PROFILE,
      page: () => ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => EditProfileView(),
      binding: ProfileBinding(),
    ),
  ];
}
