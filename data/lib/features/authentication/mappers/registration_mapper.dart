import 'package:data/features/authentication/model/registration_model.dart';
import 'package:domain/features/authentication/entities/registration_entity.dart';

extension RegistrationMapper on RegistrationEntity {
  RegistrationModel toModel() {
    return RegistrationModel(
      firstName: firstName,
      lastName: lastName,
      email: email,
      password: password,
      phoneNumber: phoneNumber,
    );
  }
}
