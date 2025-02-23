import 'dart:convert';

import 'package:common/Urls.dart';
import 'package:data/network/remote_target.dart';
import 'package:domain/features/authentication/entities/registration_entity.dart';

class RegistrationRequest extends IRemoteTarget {
  final RegistrationEntity data;

  RegistrationRequest({
    required this.data,
  }) {
    body = "Content=${Uri.encodeComponent(
      jsonEncode({
        "userName": data.userName,
        "password": data.password,
        "UserPhone": data.phoneNumber,
        "UserPhoto": data.userPhone,
        "UserEmail": data.email,
        "UserId": data.id,
        "UserName": data.userName,
        "UserPassword": data.password,
      }),
    )}";
  }

  @override
  HttpMethod get method => HttpMethod.post;

  @override
  String? get path => Urls.createAccount;

  @override
  get headers => {"Content-Type": "application/x-www-form-urlencoded"};
}
