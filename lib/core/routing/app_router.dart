import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ibn_sina_flutter/core/di/injector.dart';
import 'package:ibn_sina_flutter/core/routing/app_routes.dart';
import 'package:ibn_sina_flutter/features/contact_us/presentation/page/contact_us_screen.dart';
import 'package:ibn_sina_flutter/features/home/business_logic/home_cubit.dart';
import 'package:ibn_sina_flutter/features/home/presentation/page/home_screen.dart';

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
      default:
        return null;
    }
  }
}
