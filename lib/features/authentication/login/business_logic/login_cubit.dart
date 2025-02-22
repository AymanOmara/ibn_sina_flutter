import 'package:bloc/bloc.dart';
import 'package:domain/common/exceptions/network_exception.dart';
import 'package:domain/common/result.dart';
import 'package:domain/features/authentication/use_case/login_use_case.dart';
import 'package:ibn_sina_flutter/core/display/loading_state.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(
    this._loginUseCase,
  ) : super(LoginInitial());
  String email = "";
  String password = "";
  LoadingState loading = Idle();
  final LoginUseCase _loginUseCase;

  void submit() {
    loading = Loading();
    emit(LoginLoading());
    _loginUseCase(email, password).then((value) {
      loading = Idle();
      value.fold(onSuccess: (data) {
        emit(LoginResult(Success(data != null)));
      }, onFailure: (e) {
        emit(LoginResult(Failure(e)));
      });
    });
  }
}
