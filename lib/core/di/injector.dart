import 'package:domain/features/products/entity/product_entity.dart';
import 'package:get_it/get_it.dart';
import 'package:ibn_sina_flutter/core/display/i_success_able.dart';
import 'package:ibn_sina_flutter/features/app/business_logic/app_cubit.dart';
import 'package:ibn_sina_flutter/features/authentication/login/business_logic/login_cubit.dart';
import 'package:ibn_sina_flutter/features/authentication/registration/business_logic/registration_cubit.dart';
import 'package:ibn_sina_flutter/features/cart/business_logic/cart_cubit.dart';
import 'package:ibn_sina_flutter/features/home/business_logic/home_cubit.dart';
import 'package:ibn_sina_flutter/features/home/display/home_category_display.dart';
import 'package:ibn_sina_flutter/features/home/display/i_user_logged_in_state.dart';
import 'package:ibn_sina_flutter/features/home/presentation/widgets/drawer/sina_drawer_cubit.dart';
import 'package:ibn_sina_flutter/features/home/presentation/widgets/student_equipments/student_equipments_cubit.dart';
import 'package:ibn_sina_flutter/features/notifications/business_logic/notification_cubit.dart';
import 'package:ibn_sina_flutter/features/orders_history/business_logic/orders_history_cubit.dart';
import 'package:ibn_sina_flutter/features/product_details/business_logic/product_details_cubit.dart';
import 'package:ibn_sina_flutter/features/products/business_logic/products_cubit.dart';
import 'package:ibn_sina_flutter/features/products/display/product_list_params.dart';
import 'package:ibn_sina_flutter/features/submit_order/business_logic/submit_order_cubit.dart';

var getIt = GetIt.I;

void registerDependencies(GetIt diInjector) async {
  /// ********* Common **********
  getIt.registerSingleton(AppCubit(diInjector(), diInjector(), diInjector()));

  /// ********* Authentication **********
  getIt.registerFactoryParam(
      (p1, _) => LoginCubit(diInjector(), p1 as IUserLoggedInState));
  getIt.registerFactory(() => RegistrationCubit(diInjector()));

  /// ********* Notification **********
  getIt.registerFactory(() => NotificationCubit(diInjector()));

  /// ********* Home **********
  getIt.registerLazySingleton(() => HomeCubit(diInjector()));
  getIt.registerFactoryParam((p1, _) => StudentEquipmentsCubit(p1 as HomeCategoryDisplay));
  getIt.registerFactory(
      () => SinaDrawerCubit(diInjector(), diInjector(), diInjector()));

  /// ********* Products **********
  getIt.registerFactoryParam(
      (p1, _) => ProductsCubit(p1 as ProductListParams, diInjector()));
  getIt.registerFactoryParam(
      (p1, _) => ProductDetailsCubit(p1 as ProductEntity));

  /// ********* Orders **********
  getIt.registerSingleton(
      CartCubit(diInjector(), diInjector(), diInjector(), diInjector()));
  getIt.registerFactoryParam((p1, _) =>
      SubmitOrderCubit(diInjector(), diInjector(), p1 as ISuccessAble));
  getIt.registerFactory(() => OrdersHistoryCubit(diInjector()));
}
