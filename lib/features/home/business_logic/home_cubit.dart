import 'package:bloc/bloc.dart';
import 'package:domain/features/home/use_case/home_banner_use_case.dart';
import 'package:ibn_sina_flutter/core/display/loading_state.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this._bannerUseCase) : super(HomeInitial()) {
    fetchBanners();
  }

  final HomeBannerUseCase _bannerUseCase;
  List<String> banners = [];
  LoadingState loadingState = Loading();

  void fetchBanners() {
    loadingState = Loading();
    emit(HomeLoading());
    _bannerUseCase().then((value) {
      value.fold(onSuccess: (data) {
        banners = data;
        loadingState = LoadingSuccess(data: data);
        emit(HomeLoading());
      }, onFailure: (e) {
        loadingState = LoadingException(e);
        emit(HomeLoading());
      });
    });
  }
}
