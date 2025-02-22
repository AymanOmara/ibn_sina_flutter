import 'package:domain/features/products/entity/product_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ibn_sina_flutter/core/di/injector.dart';
import 'package:ibn_sina_flutter/core/routing/app_routes.dart';
import 'package:ibn_sina_flutter/features/authentication/login/business_logic/login_cubit.dart';
import 'package:ibn_sina_flutter/features/authentication/login/presentation/page/login_screen.dart';
import 'package:ibn_sina_flutter/features/contact_us/presentation/page/contact_us_screen.dart';
import 'package:ibn_sina_flutter/features/home/business_logic/home_cubit.dart';
import 'package:ibn_sina_flutter/features/home/display/home_category_display.dart';
import 'package:ibn_sina_flutter/features/home/presentation/page/home_screen.dart';
import 'package:ibn_sina_flutter/features/product_details/business_logic/product_details_cubit.dart';
import 'package:ibn_sina_flutter/features/product_details/presentation/page/product_details_screen.dart';
import 'package:ibn_sina_flutter/features/products/business_logic/products_cubit.dart';
import 'package:ibn_sina_flutter/features/products/presentation/page/products_screen.dart';

class AppRouter {
  Route? generateRouter(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.home:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<HomeCubit>(),
            child: HomeScreen(),
          ),
        );
      case AppRoutes.contactUs:
        return MaterialPageRoute(
          builder: (_) => ContactUsScreen(),
        );
      case AppRoutes.products:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<ProductsCubit>(
              param1: settings.arguments as HomeCategoryDisplay,
            ),
            child: ProductsScreen(),
          ),
        );
      case AppRoutes.productDetails:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<ProductDetailsCubit>(
              param1: settings.arguments as ProductEntity,
            ),
            child: ProductDetailsScreen(),
          ),
        );
      case AppRoutes.login:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => getIt<LoginCubit>(),
            child: LoginScreen(
            ),
          ),
        );
      default:
        return null;
    }
  }
}
