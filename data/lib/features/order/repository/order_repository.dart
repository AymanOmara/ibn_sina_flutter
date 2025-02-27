import 'package:data/features/order/model/order_model.dart';
import 'package:data/features/order/request/create_order_request.dart';
import 'package:data/network/i_base_api.dart';
import 'package:domain/common/exceptions/network_exception.dart';
import 'package:domain/common/result.dart';
import 'package:domain/features/order/entity/create_order_entity.dart';
import 'package:domain/features/order/entity/order_entity.dart';
import 'package:domain/features/order/repository/i_order_repository.dart';
import 'package:domain/locale_storage/i_user_local.dart';

class OrderRepository implements IOrderRepository {
  final IAPIService _service;
  final IUserLocal _userLocal;

  OrderRepository(
    this._service,
    this._userLocal,
  );

  @override
  Future<Result<OrderEntity?, NetworkException>> createOrder(
    CreateOrderEntity order,
  ) async {
    var result = await _service.fetchData<OrderModel>(
      CreateOrderRequest(
        entity: order,
        userId: _userLocal.getUser()?.userId ?? "",
      ),
      data: OrderModel(),
    );
    return result.fold(onSuccess: (data) {
      return Success(data?.toEntity());
    }, onFailure: (e) {
      return Failure(e);
    });
  }
}
