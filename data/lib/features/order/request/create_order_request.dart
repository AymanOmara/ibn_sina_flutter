import 'dart:convert';

import 'package:common/Urls.dart';
import 'package:data/network/remote_target.dart';
import 'package:domain/features/order/entity/create_order_entity.dart';

class CreateOrderRequest extends IRemoteTarget {
  final CreateOrderEntity entity;
  final String userId;

  CreateOrderRequest({
    required this.entity,
    required this.userId,
  }) {
    body = "Content=${Uri.encodeComponent(jsonEncode({
          "UserId": int.tryParse(userId) ?? 0,
          "OrderLocation": entity.address,
          "DeliveryFees": "69",
          "OrderAcceptTime": "2025-02-27 20:18:42",
          "OrderCompleteTime": "2025-02-27 20:18:42",
          "OrderTime": "2025-02-27 20:18:42",
          "OrderExcuteTime": "2025-02-27 20:18:42",
          "OrderStatus": "Pendding",
          "UserAvilableTime": "${entity.startTime} - ${entity.endTime}",
          "OrderPhone": entity.phoneNumber,
          "PaymentMethod": "Cash",
          "OrderGovernorate": entity.governorate,
          "OrderPrice": entity.totalPrice.toString(),
          "OrderAmount": entity.products.length.toString(),
          "OrderProuductList": entity.products
              .map((product) => {
                    "OrderId": 0,
                    "ProuductId": product.product.productId,
                    "Price": product.product.price,
                    "Amount": product.count,
                  })
              .toList(),
        }))}";
  }

  @override
  HttpMethod get method => HttpMethod.post;

  @override
  String? get path => Urls.createOrder;

  @override
  get headers => {"Content-Type": "application/x-www-form-urlencoded"};
}
