import 'package:bloc/bloc.dart';
import 'package:domain/features/products/entity/fetch_product_request.dart';
import 'package:domain/features/products/entity/product_entity.dart';
import 'package:domain/features/products/use_case/fetch_products_use_case.dart';
import 'package:ibn_sina_flutter/core/display/loading_state.dart';
import 'package:ibn_sina_flutter/features/home/display/home_category_display.dart';
import 'package:ibn_sina_flutter/features/products/display/product_list_params.dart';
import 'package:meta/meta.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit(
    this.params,
    this._fetchProductsUseCase,
  ) : super(ProductsInitial()) {
    fetchProducts();
  }

  LoadingState loading = Loading();
  final ProductListParams params;
  final FetchProductsUseCase _fetchProductsUseCase;
  List<ProductEntity> products = [];

  void fetchProducts() {
    loading = Loading();
    emit(ProductsLoading());
    _fetchProductsUseCase(params.request).then((value) {
      value.fold(onSuccess: (data) {
        products = data;
        loading = LoadingSuccess(data: data);
        emit(ProductsLoading());
      }, onFailure: (e) {
        loading = LoadingException(e);
        emit(ProductsLoading());
      });
    });
  }
}
