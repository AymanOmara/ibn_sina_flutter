import 'package:domain/common/exceptions/network_exception.dart';
import 'package:domain/common/response.dart';
import 'package:domain/common/result.dart';
import 'package:domain/features/authentication/entities/forget_password_entity.dart';
import 'package:domain/features/authentication/entities/registration_entity.dart';
import 'package:domain/features/authentication/entities/registration_response.dart';
import 'package:domain/features/authentication/entities/token_entity.dart';
import 'package:domain/features/authentication/entities/user_entity.dart';

abstract interface class IAuthRepository {
  Future<Result<UserEntity?, NetworkException>> login(String email, String password);

  Future<Result<bool,NetworkException>> deleteAccount();

  Future<Result<RegistrationResponseStatus,NetworkException>> createUser(RegistrationEntity entity);
}
