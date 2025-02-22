import 'dart:convert';

import 'package:common/Urls.dart';
import 'package:data/network/remote_target.dart';

class LoginRequest extends IRemoteTarget {
  final String email;
  final String password;

  LoginRequest({
    required this.email,
    required this.password,
  }) {
    body = "Content=${Uri.encodeComponent(
      jsonEncode({
        "phone": email,
        "password": password,
        "UserId":"",
      }),
    )}";
  }

  @override
  HttpMethod get method => HttpMethod.post;

  @override
  String? get path => Urls.login;
  @override
  get headers => {"Content-Type": "application/x-www-form-urlencoded"};
}
