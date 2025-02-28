import 'package:common/Urls.dart';
import 'package:data/network/remote_target.dart';

class OrdersHistoryRequest extends IRemoteTarget {
  final String userID;

  OrdersHistoryRequest({
    required this.userID,
  }) {
    body = "Content=${Uri.encodeComponent(userID)}";
  }

  @override
  String? get path => Urls.myOrders;

  @override
  HttpMethod get method => HttpMethod.post;

  @override
  get headers => {"Content-Type": "application/x-www-form-urlencoded"};
}
