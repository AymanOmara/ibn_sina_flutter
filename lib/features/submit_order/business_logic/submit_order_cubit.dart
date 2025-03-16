import 'package:bloc/bloc.dart';
import 'package:domain/features/cart/use_case/get_cart_products.dart';
import 'package:domain/features/order/entity/create_order_entity.dart';
import 'package:domain/features/order/use_case/create_order_use_case.dart';
import 'package:ibn_sina_flutter/core/display/i_success_able.dart';
import 'package:ibn_sina_flutter/core/display/loading_state.dart';
import 'package:meta/meta.dart';

part 'submit_order_state.dart';

class SubmitOrderCubit extends Cubit<SubmitOrderState> {
  SubmitOrderCubit(
    this._cartProductUseCase,
    this._createOrderUseCase,
    this._successAble,
  ) : super(SubmitOrderInitial());
  final GetCartProductUseCase _cartProductUseCase;
  int selectedPaymentIndex = 0;
  String startTime = '';
  String endTime = '';
  CreateOrderEntity orderEntity = CreateOrderEntity();
  final CreateOrderUseCase _createOrderUseCase;
  final ISuccessAble _successAble;
  LoadingState loadingState = Idle();

  double totalAmount() {
    if (_cartProductUseCase().isEmpty) return 0;
    return _cartProductUseCase()
        .map((e) => (e.product.price ?? 0) * e.count)
        .toList()
        .reduce((value, element) => value + element);
  }

  void updatePaymentIndex(int index) {
    selectedPaymentIndex = index;
    emit(SubmitOrderInitial());
  }

  void updateStartTime(String time) {
    startTime = time;
    emit(SubmitOrderInitial());
  }

  void updateEndTime(String time) {
    endTime = time;
    emit(SubmitOrderInitial());
  }

  void submitOrder() {
    loadingState = Loading();
    orderEntity.products = _cartProductUseCase();
    orderEntity.startTime = startTime;
    orderEntity.endTime = endTime;
    orderEntity.paymentMethod = selectedPaymentIndex.toString();
    orderEntity.totalPrice = totalAmount();
    emit(SubmitOrderInitial());
    _createOrderUseCase(orderEntity).then((value) {
      loadingState = Idle();
      value.fold(onSuccess: (data) {
        _successAble.onSuccess();
        emit(SubmitOrderResult(success: true, message: ""));
      }, onFailure: (e) {
        emit(SubmitOrderResult(success: false, message: e.message));
      });
    });
  }
}
