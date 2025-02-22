import 'package:bloc/bloc.dart';
import 'package:domain/features/authentication/entities/user_entity.dart';
import 'package:domain/features/home/use_case/fetch_user_details_use_case.dart';
import 'package:domain/features/home/use_case/logout_use_case.dart';
import 'package:ibn_sina_flutter/core/di/injector.dart';
import 'package:ibn_sina_flutter/features/app/business_logic/app_cubit.dart';
import 'package:meta/meta.dart';

part 'sina_drawer_state.dart';

class SinaDrawerCubit extends Cubit<SinaDrawerState> {
  SinaDrawerCubit(
    this._fetchUserDetailsUseCase,
    this._logoutUseCase,
  ) : super(SinaDrawerInitial()) {
    isUserLoggedIn = getIt<AppCubit>().isUserLoggedIn();
    user = _fetchUserDetailsUseCase();
  }

  bool isUserLoggedIn = false;
  final FetchUserDetailsUseCase _fetchUserDetailsUseCase;
  final LogoutUseCase _logoutUseCase;
  UserEntity? user;

  void logout() {
    isUserLoggedIn = false;
    _logoutUseCase();
    emit(SinaDrawerLogoutUser());
  }
}
