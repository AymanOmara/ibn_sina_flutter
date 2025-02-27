part of 'submit_order_cubit.dart';

@immutable
sealed class SubmitOrderState {}

final class SubmitOrderInitial extends SubmitOrderState {}

final class SubmitOrderResult extends SubmitOrderState {
  final bool success;
  final String message;

  SubmitOrderResult({
    required this.message,
    required this.success,
  });
}
