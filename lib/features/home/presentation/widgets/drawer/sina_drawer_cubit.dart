import 'package:bloc/bloc.dart';
import 'package:ibn_sina_flutter/core/di/injector.dart';
import 'package:ibn_sina_flutter/features/app/business_logic/app_cubit.dart';
import 'package:meta/meta.dart';

part 'sina_drawer_state.dart';

class SinaDrawerCubit extends Cubit<SinaDrawerState> {
  SinaDrawerCubit() : super(SinaDrawerInitial()) {
    isUserLoggedIn = getIt<AppCubit>().isUserLoggedIn();
  }

  bool isUserLoggedIn = false;

}
