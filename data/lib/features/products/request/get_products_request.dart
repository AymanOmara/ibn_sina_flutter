import 'dart:convert';
import 'package:common/Urls.dart';
import 'package:data/network/remote_target.dart';

class GetProductsRequest extends IRemoteTarget {
  final String product;

  GetProductsRequest({required this.product}) {
    path = Urls.products+product;
  }

  @override
  HttpMethod get method => HttpMethod.get;

}
