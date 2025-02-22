import 'package:domain/common/exceptions/network_exception.dart';
import 'package:domain/common/response.dart';
import 'package:domain/common/result.dart';
import 'package:domain/features/authentication/entities/registration_entity.dart';
import 'package:domain/features/authentication/repositories/i_auth_repository.dart';

class RegistrationUseCase {
  final IAuthRepository _authRepository;

  const RegistrationUseCase(this._authRepository);

  Future<Result<Response<bool>, NetworkException>> call(
    RegistrationEntity entity,
  ) async {
    return await _authRepository.registration(entity);
  }
}
