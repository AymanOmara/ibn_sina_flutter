import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:ibn_sina_flutter/core/display/loading_state.dart';
import 'package:meta/meta.dart';

part 'notification_state.dart';

class NotificationCubit extends Cubit<NotificationState> {
  NotificationCubit() : super(NotificationInitial()) {
    fetchNotifications();
  }

  LoadingState loading = Loading();

  void fetchNotifications() {
    Future.delayed(const Duration(seconds: 2)).then((_) {
      loading = LoadingSuccess(data: "null");
      emit(NotificationInitial());
    });
  }
}
