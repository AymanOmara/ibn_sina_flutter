import 'package:data/features/authentication/model/token.dart';
import 'package:domain/features/authentication/entities/token_entity.dart';

extension TokenMapper on TokenModel? {
  TokenEntity toEntity() {
    return TokenEntity(
      accessToken: this?.token ?? "",
      refreshToken: this?.refreshToken ?? "",
    );
  }
}
