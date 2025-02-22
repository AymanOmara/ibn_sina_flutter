import 'dart:convert';

import 'package:data/network/decode_able.dart';
import 'package:domain/features/authentication/entities/user_entity.dart';
import 'package:xml/xml.dart';

class UserModel implements DecodeAble<UserModel?, String> {
  String? userId;
  String? userName;
  String? userEmail;
  String? userPassword;
  String? userPhone;
  String? userPhoto;

  UserModel({
    this.userEmail,
    this.userId,
    this.userName,
    this.userPassword,
    this.userPhone,
    this.userPhoto,
  });

  @override
  UserModel? fromJson(String json) {
    final document = XmlDocument.parse(json);

    String jsonString = document.rootElement.innerText;

    dynamic jsonData = jsonDecode(jsonString);
    return UserModel.fromJson(jsonData);
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      userId: json['UserId'] ?? '',
      userName: json['UserName'] ?? '',
      userEmail: json['UserEmail'] ?? '',
      userPassword: json['UserPassword'] ?? '',
      userPhone: json['UserPhone'] ?? '',
      userPhoto: json['UserPhoto'] ?? '',
    );
  }

  UserEntity toEntity() {
    return UserEntity(
      userId: userId ?? "",
      userName: userName ?? "",
      userEmail: userEmail ?? "",
      userPassword: userPassword ?? "",
      userPhone: userPhone ?? "",
      userPhoto: userPhoto ?? "",
    );
  }
}
