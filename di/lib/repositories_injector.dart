import 'package:data/features/home/repository/home_repository.dart';
import 'package:data/features/products/repository/products_repository.dart';
import 'package:domain/features/home/repository/i_home_repository.dart';
import 'package:domain/features/products/repository/i_products_repository.dart';
import 'package:get_it/get_it.dart';

Future<void> setupRepositoryInjector(GetIt diInjector) async {
  /// ********* Auth **********
  // diInjector.registerSingleton<IAuthRepository>(AuthRepository(diInjector(),diInjector()));
  
  /// ********* Home **********
   diInjector.registerSingleton<IHomeRepository>(HomeRepository(diInjector()));

   /// ********* Products **********
   diInjector.registerSingleton<IProductsRepository>(ProductsRepository(diInjector()));
}