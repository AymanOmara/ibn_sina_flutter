import 'package:domain/features/app/use_case/get_current_language_use_case.dart';
import 'package:domain/features/app/use_case/init_language_use_case.dart';
import 'package:domain/features/app/use_case/is_user_logged_in_use_case.dart';
import 'package:domain/features/app/use_case/update_language_use_case.dart';
import 'package:domain/features/authentication/use_case/email_verification_use_case.dart';
import 'package:domain/features/authentication/use_case/forget_password_use_case.dart';
import 'package:domain/features/authentication/use_case/login_use_case.dart';
import 'package:domain/features/authentication/use_case/register_fcm_token_use_case.dart';
import 'package:domain/features/authentication/use_case/registration_use_case.dart';
import 'package:domain/features/authentication/use_case/verify_otp_use_case.dart';
import 'package:domain/features/home/use_case/home_banner_use_case.dart';
import 'package:domain/features/products/use_case/fetch_products_use_case.dart';
import 'package:get_it/get_it.dart';

Future<void> setupUseCaseInjector(GetIt diInjector) async {
  /// ********* App **********
  diInjector.registerFactory(()=> GetCurrentLanguageUseCase(diInjector()));
  diInjector.registerFactory(()=> UpdateLanguageUseCase(diInjector()));
  diInjector.registerFactory(()=> InitLanguageUseCase(diInjector()));
  diInjector.registerFactory(()=> IsUserLoggedInUseCase(diInjector()));

  /// ********* Auth **********
  // diInjector.registerFactory(() => LoginUseCase(diInjector()));
  // diInjector.registerFactory(() => EmailVerificationUseCase(diInjector()));
  // diInjector.registerFactory(() => RegistrationUseCase(diInjector()));
  // diInjector.registerFactory(() => VerifyOtpUseCase(diInjector()));
  // diInjector.registerFactory(() => ForgetPasswordUseCase(diInjector()));
  //
  /// ********* Home **********
  diInjector.registerFactory(() => HomeBannerUseCase(diInjector()));

  /// ********* Products **********
  diInjector.registerFactory(() => FetchProductsUseCase(diInjector()));

}
