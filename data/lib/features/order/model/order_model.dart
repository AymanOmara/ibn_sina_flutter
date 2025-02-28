import 'dart:convert';

import 'package:data/network/decode_able.dart';
import 'package:domain/features/order/entity/order_entity.dart';
import 'package:xml/xml.dart';

class OrderModel implements DecodeAble<OrderModel?, String> {
  final int? orderId;
  final int? userId;
  final String? orderTime;
  final String? orderStatus;
  final String? orderAcceptTime;
  final String? orderPrice;
  final String? orderLocation;
  final String? orderPhone;
  final String? paymentMethod;
  final String? deliveryFees;
  final String? orderExecuteTime;
  final String? orderCompleteTime;
  final String? userAvailableTime;
  final String? orderAmount;
  final String? orderGovernorate;
  final List<OrderProductModel>? orderProductList;

  OrderModel({
    this.orderId,
    this.userId,
    this.orderTime,
    this.orderStatus,
    this.orderAcceptTime,
    this.orderPrice,
    this.orderLocation,
    this.orderPhone,
    this.paymentMethod,
    this.deliveryFees,
    this.orderExecuteTime,
    this.orderCompleteTime,
    this.userAvailableTime,
    this.orderAmount,
    this.orderGovernorate,
    this.orderProductList,
  });

  // Convert JSON to Model
  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      orderId: json["OrderId"],
      userId: json["UserId"],
      orderTime: json["OrderTime"],
      orderStatus: json["OrderStatus"],
      orderAcceptTime: json["OrderAcceptTime"],
      orderPrice: json["OrderPrice"],
      orderLocation: json["OrderLocation"],
      orderPhone: json["OrderPhone"],
      paymentMethod: json["PaymentMethod"],
      deliveryFees: json["DeliveryFees"],
      orderExecuteTime: json["OrderExcuteTime"],
      orderCompleteTime: json["OrderCompleteTime"],
      userAvailableTime: json["UserAvilableTime"],
      orderAmount: json["OrderAmount"],
      orderGovernorate: json["OrderGovernorate"],
      orderProductList: (json["OrderProuductList"] as List?)
          ?.map((e) => OrderProductModel.fromJson(e))
          .toList(),
    );
  }

  // Convert Model to JSON
  Map<String, dynamic> toJson() {
    return {
      "OrderId": orderId,
      "UserId": userId,
      "OrderTime": orderTime,
      "OrderStatus": orderStatus,
      "OrderAcceptTime": orderAcceptTime,
      "OrderPrice": orderPrice,
      "OrderLocation": orderLocation,
      "OrderPhone": orderPhone,
      "PaymentMethod": paymentMethod,
      "DeliveryFees": deliveryFees,
      "OrderExcuteTime": orderExecuteTime,
      "OrderCompleteTime": orderCompleteTime,
      "UserAvilableTime": userAvailableTime,
      "OrderAmount": orderAmount,
      "OrderGovernorate": orderGovernorate,
      "OrderProuductList": orderProductList?.map((e) => e.toJson()).toList(),
    };
  }

  @override
  OrderModel? fromJson(String json) {
    final document = XmlDocument.parse(json);
    String jsonString = document.rootElement.innerText;
    dynamic jsonData = jsonDecode(jsonString);
    return OrderModel.fromJson(
        jsonData
    );
  }
  OrderEntity toEntity() {
    return OrderEntity(
      orderId: orderId ?? 0,
      userId: userId ?? 0,
      orderTime: orderTime ?? "",
      orderStatus: orderStatus ?? "",
      orderAcceptTime: orderAcceptTime ?? "",
      orderPrice: double.tryParse(orderPrice ?? "0") ?? 0.0,
      orderLocation: orderLocation ?? "",
      orderPhone: orderPhone ?? "",
      paymentMethod: paymentMethod ?? "",
      deliveryFees: double.tryParse(deliveryFees ?? "0") ?? 0.0,
      orderExecuteTime: orderExecuteTime ?? "",
      orderCompleteTime: orderCompleteTime ?? "",
      userAvailableTime: userAvailableTime ?? "",
      orderAmount: double.tryParse(orderAmount ?? "0") ?? 0.0,
      orderGovernorate: orderGovernorate ?? "",
      orderProductList: orderProductList?.map((e) => e.toEntity()).toList() ?? [],
    );
  }
}

class OrderProductModel {
  final int? orderId;
  final int? productId;
  final int? amount;
  final double? price;

  OrderProductModel({this.orderId, this.productId, this.amount, this.price});

  factory OrderProductModel.fromJson(Map<String, dynamic> json) {
    return OrderProductModel(
      orderId: json["OrderId"],
      productId: json["ProuductId"],
      amount: json["Amount"],
      price: (json["Price"] as num?)?.toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "OrderId": orderId,
      "ProuductId": productId,
      "Amount": amount,
      "Price": price,
    };
  }
  OrderProductEntity toEntity() {
    return OrderProductEntity(
      orderId: orderId ?? 0,
      productId: productId ?? 0,
      amount: amount ?? 0,
      price: price ?? 0.0,
    );
  }
}
