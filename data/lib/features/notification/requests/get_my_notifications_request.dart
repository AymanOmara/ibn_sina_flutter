import 'package:common/Urls.dart';
import 'package:data/network/remote_target.dart';

class GetMyNotificationRequest extends IRemoteTarget {
  final String userID;

  GetMyNotificationRequest({
    required this.userID,
  }) {
    body = "Content=${Uri.encodeComponent(userID)}";
  }

  @override
  HttpMethod get method => HttpMethod.post;

  @override
  String? get path => Urls.notifications;

  @override
  get headers => {"Content-Type": "application/x-www-form-urlencoded"};
}
