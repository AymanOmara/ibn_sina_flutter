import 'dart:convert';
import 'package:common/Urls.dart';
import 'package:data/network/remote_target.dart';
import 'package:domain/features/products/entity/fetch_product_request.dart';

class GetProductsRequest extends IRemoteTarget {
  final FetchProductsRequest request;

  GetProductsRequest({required this.request}) {
    // path = Urls.products+product;
  }

  @override
  HttpMethod get method => HttpMethod.get;
}
