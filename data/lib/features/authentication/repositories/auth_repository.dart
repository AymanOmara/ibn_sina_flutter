import 'package:data/features/authentication/model/delete_account_model.dart';
import 'package:data/features/authentication/model/registration_model.dart';
import 'package:data/features/authentication/model/user_model.dart';
import 'package:data/features/authentication/request/delete_account_request.dart';
import 'package:data/features/authentication/request/login_request.dart';
import 'package:data/features/authentication/request/registration_request.dart';

import 'package:data/network/i_base_api.dart';
import 'package:domain/common/exceptions/network_exception.dart';

import 'package:domain/common/result.dart';
import 'package:domain/features/authentication/entities/registration_entity.dart';
import 'package:domain/features/authentication/entities/registration_response.dart';
import 'package:domain/features/authentication/entities/user_entity.dart';
import 'package:domain/features/authentication/repositories/i_auth_repository.dart';
import 'package:domain/locale_storage/i_user_local.dart';

class AuthRepository implements IAuthRepository {
  final IAPIService _service;
  final IUserLocal _userLocal;

  const AuthRepository(
    this._service,
    this._userLocal,
  );

  @override
  Future<Result<UserEntity?, NetworkException>> login(
      String email, String password) async {
    var result = await _service.fetchData<UserModel>(
        LoginRequest(email: email, password: password),
        data: UserModel());
    return result.fold(onSuccess: (data) {
      if (data != null) {
        _userLocal.saveUser(data.toEntity());
        return Success(data.toEntity());
      }
      return Success(null);
    }, onFailure: (e) {
      return Failure(e);
    });
  }

  @override
  Future<Result<bool, NetworkException>> deleteAccount() async {
    var result = await _service.fetchData<DeleteAccountModel>(
        DeleteAccountRequest(userId: _userLocal.getUser()?.userId ?? 0),
        data: DeleteAccountModel());
    return result.fold(
        onSuccess: (data) {

          return Success(data?.success ?? false);
        },
        onFailure: (e) => Failure(e));
  }

  @override
  Future<Result<UserEntity?, NetworkException>> createUser(
    RegistrationEntity entity,
  ) async {
    var result = await _service.fetchData<UserModel>(
        RegistrationRequest(data: entity),
        data: UserModel());
    return result.fold(onSuccess: (data) {
      return Success(data?.toEntity());
    }, onFailure: (e) {
      return Failure(e);
    });
  }
}
