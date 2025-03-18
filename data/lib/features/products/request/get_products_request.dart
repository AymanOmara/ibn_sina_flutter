import 'dart:convert';
import 'package:common/Urls.dart';
import 'package:data/network/remote_target.dart';
import 'package:domain/features/products/entity/fetch_product_request.dart';

class GetProductsRequest extends IRemoteTarget {
  final FetchProductsRequest request;

  GetProductsRequest({required this.request}) {
    path = "${Urls.products}${request.categoryName}";
    queryParameters = {
      "firstYear": request.firstYear ? "T" : "F",
      "secondYear": request.secondYear ? "T" : "F",
      "thirdYear": request.thirdYear ? "T" : "F",
      "forthYear": request.fourthYear ? "T" : "F",
      "fifthYear": request.fifthYear ? "T" : "F",
      "Clothes": request.otherEquipment ? "T" : "F",
      "Teeth": request.otherEquipment ? "T" : "F",
    };
  }

  @override
  HttpMethod get method => HttpMethod.get;
}
