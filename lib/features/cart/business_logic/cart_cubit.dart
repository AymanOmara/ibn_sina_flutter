import 'package:bloc/bloc.dart';
import 'package:domain/features/cart/entity/cart_entity.dart';
import 'package:domain/features/cart/use_case/add_to_cart_use_case.dart';
import 'package:domain/features/cart/use_case/empty_cart_use_case.dart';
import 'package:domain/features/cart/use_case/get_cart_products.dart';
import 'package:domain/features/cart/use_case/remove_from_cart.dart';
import 'package:domain/features/products/entity/product_entity.dart';
import 'package:ibn_sina_flutter/core/display/i_success_able.dart';
import 'package:meta/meta.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> implements ISuccessAble {
  CartCubit(
    this._removeCartProductUseCase,
    this._getCartProductUseCase,
    this._addToCartUseCase,
    this._emptyCartUseCase,
  ) : super(CartInitial());
  List<CartEntity> products = [];
  final AddToCartUseCase _addToCartUseCase;
  final RemoveCartProductUseCase _removeCartProductUseCase;
  final GetCartProductUseCase _getCartProductUseCase;
  final EmptyCartUseCase _emptyCartUseCase;

  void addToCart(ProductEntity product) {
    products = _addToCartUseCase(product);
    emit(CartInitial());
  }

  void removeFromCart(ProductEntity product) {
    products = _removeCartProductUseCase(product);
    emit(CartInitial());
  }

  void clear() {
    _emptyCartUseCase();
    products.clear();
    emit(CartInitial());
  }

  @override
  void onSuccess() {
    clear();
  }
}
