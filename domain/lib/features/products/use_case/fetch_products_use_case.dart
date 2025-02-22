import 'package:domain/common/exceptions/network_exception.dart';
import 'package:domain/common/result.dart';
import 'package:domain/features/products/entity/product_entity.dart';
import 'package:domain/features/products/repository/i_products_repository.dart';

class FetchProductsUseCase {
  final IProductsRepository _repository;

  const FetchProductsUseCase(this._repository);

  Future<Result<List<ProductEntity>,NetworkException>> call(String categoryName) {
    return _repository.fetchProducts(categoryName);
  }
}
