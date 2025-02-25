import 'package:domain/features/app/use_case/get_current_language_use_case.dart';
import 'package:domain/features/app/use_case/init_language_use_case.dart';
import 'package:domain/features/app/use_case/is_user_logged_in_use_case.dart';
import 'package:domain/features/app/use_case/update_language_use_case.dart';
import 'package:domain/features/authentication/use_case/delete_account_use_case.dart';
import 'package:domain/features/authentication/use_case/login_use_case.dart';
import 'package:domain/features/authentication/use_case/registration_use_case.dart';
import 'package:domain/features/home/use_case/fetch_user_details_use_case.dart';
import 'package:domain/features/home/use_case/home_banner_use_case.dart';
import 'package:domain/features/home/use_case/logout_use_case.dart';
import 'package:domain/features/notifications/use_case/get_use_notifications_use_case.dart';
import 'package:domain/features/products/use_case/fetch_products_use_case.dart';
import 'package:get_it/get_it.dart';

Future<void> setupUseCaseInjector(GetIt diInjector) async {
  /// ********* App **********
  diInjector.registerFactory(() => GetCurrentLanguageUseCase(diInjector()));
  diInjector.registerFactory(() => UpdateLanguageUseCase(diInjector()));
  diInjector.registerFactory(() => InitLanguageUseCase(diInjector()));
  diInjector.registerFactory(() => IsUserLoggedInUseCase(diInjector()));

  /// ********* Auth **********
  diInjector.registerFactory(() => LoginUseCase(diInjector()));
  diInjector.registerFactory(() => DeleteAccountUseCase(diInjector()));
  diInjector.registerFactory(() => RegistrationUseCase(diInjector()));
  // diInjector.registerFactory(() => EmailVerificationUseCase(diInjector()));
  // diInjector.registerFactory(() => RegistrationUseCase(diInjector()));
  // diInjector.registerFactory(() => VerifyOtpUseCase(diInjector()));
  // diInjector.registerFactory(() => ForgetPasswordUseCase(diInjector()));
  //
  /// ********* Home **********
  diInjector.registerFactory(() => HomeBannerUseCase(diInjector()));
  diInjector.registerFactory(() => FetchUserDetailsUseCase(diInjector()));
  diInjector.registerFactory(() => LogoutUseCase(diInjector()));

  /// ********* Products **********
  diInjector.registerFactory(() => FetchProductsUseCase(diInjector()));


  /// ********* Notifications **********
  diInjector.registerFactory(() => GetUserNotificationsUseCase(diInjector()));
}
