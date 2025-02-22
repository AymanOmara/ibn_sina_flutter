import 'package:domain/features/products/entity/product_entity.dart';
import 'package:get_it/get_it.dart';
import 'package:ibn_sina_flutter/features/app/business_logic/app_cubit.dart';
import 'package:ibn_sina_flutter/features/authentication/login/business_logic/login_cubit.dart';
import 'package:ibn_sina_flutter/features/home/business_logic/home_cubit.dart';
import 'package:ibn_sina_flutter/features/home/display/home_category_display.dart';
import 'package:ibn_sina_flutter/features/home/presentation/widgets/drawer/sina_drawer_cubit.dart';
import 'package:ibn_sina_flutter/features/notifications/business_logic/notification_cubit.dart';
import 'package:ibn_sina_flutter/features/product_details/business_logic/product_details_cubit.dart';
import 'package:ibn_sina_flutter/features/products/business_logic/products_cubit.dart';

var getIt = GetIt.I;

void registerDependencies(GetIt diInjector) async {
  /// ********* Common **********
  getIt.registerSingleton(AppCubit(diInjector(),diInjector(),diInjector()));

  /// ********* Authentication **********
  getIt.registerFactory(() => LoginCubit(diInjector()));

  /// ********* Notification **********
  getIt.registerFactory(() => NotificationCubit());

  /// ********* Home **********
  getIt.registerFactory(() => HomeCubit(diInjector()));
  getIt.registerFactory(() => SinaDrawerCubit());

  /// ********* Products **********
  getIt.registerFactoryParam((p1,_) => ProductsCubit(p1 as HomeCategoryDisplay,diInjector()));
  getIt.registerFactoryParam((p1,_) => ProductDetailsCubit(p1 as ProductEntity));


}
