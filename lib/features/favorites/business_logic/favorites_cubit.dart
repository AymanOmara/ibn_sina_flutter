import 'package:bloc/bloc.dart';
import 'package:domain/features/favorites/usecase/FetchFavoritesUseCase.dart';
import 'package:domain/features/favorites/usecase/remove_favorite_use_case.dart';
import 'package:domain/features/products/entity/product_entity.dart';
import 'package:get/get.dart';
import 'package:ibn_sina_flutter/core/display/loading_state.dart';
import 'package:meta/meta.dart';

part 'favorites_state.dart';

class FavoritesCubit extends Cubit<FavoritesState> {
  FavoritesCubit(
    this._fetchFavoritesUseCase,
    this._removeFavoriteUseCase,
  ) : super(FavoritesInitial()) {
    fetchFavorites();
  }

  final FetchFavoritesUseCase _fetchFavoritesUseCase;

  final RemoveFavoriteUseCase _removeFavoriteUseCase;
  List<ProductEntity> favorites = [];
  LoadingState loading = Loading();

  void fetchFavorites() {
    loading = Loading();
    emit(FavoritesLoading());
    _fetchFavoritesUseCase().then((result) {
      result.fold(
        onSuccess: (data) {
          loading = LoadingSuccess(data: data);
          favorites = data;
          emit(FavoritesLoading());
        },
        onFailure: (e) {
          loading = LoadingException(e);
          emit(FavoritesLoading());
        },
      );
    });
  }

  void removeFromFavorite(ProductEntity product) {
    loading = Loading(showSuccessWidget: true);
    emit(FavoritesLoading());
    _removeFavoriteUseCase(product).then((value) {
      loading = LoadingSuccess(data: "");
      value.fold(
        onSuccess: (data) {
          product.isFavorite = false;
          favorites.removeWhere((pr) => pr.productId == product.productId);
          emit(
            FavoritesRemoveResult(
              success: true,
              message: "success_delete_favorite".tr,
            ),
          );
        },
        onFailure: (e) {
          emit(
            FavoritesRemoveResult(
              success: false,
              message: e.message.tr,
            ),
          );
        },
      );
    });
  }
}
