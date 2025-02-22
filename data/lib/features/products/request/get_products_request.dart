import 'dart:convert';
import 'package:common/Urls.dart';
import 'package:data/network/remote_target.dart';

class GetProductsRequest extends IRemoteTarget {
  final String product;

  GetProductsRequest({required this.product}) {
    path = Urls.products;
    body = "Content=${Uri.encodeComponent(jsonEncode({
          "Type": product,
          "SearchText": "",
          "AlphaBit": null,
        }))}";
  }

  @override
  HttpMethod get method => HttpMethod.post;

  @override
  get headers => {"Content-Type": "application/x-www-form-urlencoded"};
}
