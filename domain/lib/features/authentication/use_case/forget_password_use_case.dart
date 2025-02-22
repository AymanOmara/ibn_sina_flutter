import 'package:domain/common/exceptions/network_exception.dart';
import 'package:domain/common/response.dart';
import 'package:domain/common/result.dart';
import 'package:domain/features/authentication/entities/forget_password_entity.dart';
import 'package:domain/features/authentication/repositories/i_auth_repository.dart';

class ForgetPasswordUseCase {
  final IAuthRepository _repository;

  ForgetPasswordUseCase(this._repository);

  Future<Result<Response<bool>, NetworkException>> call(
    ForgetPasswordEntity entity,
  ) async {
    return await _repository.forgetPassword(entity);
  }
}
