import 'package:domain/common/exceptions/network_exception.dart';
import 'package:domain/common/response.dart';
import 'package:domain/common/result.dart';
import 'package:domain/features/authentication/entities/token_entity.dart';
import 'package:domain/features/authentication/repositories/i_auth_repository.dart';

class LoginUseCase {
  final IAuthRepository _repository;

  const LoginUseCase(this._repository);

  Future<Result<Response<TokenEntity>, NetworkException>> call(
    String email,
    String password,
  ) async {
    return await _repository.login(email, password);
  }
}
