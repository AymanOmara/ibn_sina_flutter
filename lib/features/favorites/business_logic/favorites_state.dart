part of 'favorites_cubit.dart';

@immutable
abstract class FavoritesState {}

final class FavoritesInitial extends FavoritesState {}

final class FavoritesLoading extends FavoritesState {}

final class FavoritesRemoveResult extends FavoritesState {
  final String message;
  final bool success;

  FavoritesRemoveResult({
    required this.message,
    required this.success,
  });
}
