import 'package:bloc/bloc.dart';
import 'package:domain/features/home/use_case/home_banner_use_case.dart';
import 'package:get/get.dart';
import 'package:ibn_sina_flutter/core/display/loading_state.dart';
import 'package:ibn_sina_flutter/core/ui/theme/colors.dart';
import 'package:ibn_sina_flutter/features/home/display/home_category_display.dart';
import 'package:ibn_sina_flutter/features/home/display/i_user_logged_in_state.dart';
import 'package:ibn_sina_flutter/features/home/display/product_type.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> implements IUserLoggedInState {
  HomeCubit(this._bannerUseCase) : super(HomeInitial()) {
    fetchBanners();
  }

  final HomeBannerUseCase _bannerUseCase;
  List<String> banners = [];
  LoadingState loadingState = Loading();
  List<HomeCategoryDisplay> categories = [
    HomeCategoryDisplay(
      color: orangeColor,
      title: "students_equipments".tr,
      iconPath: "students_equipments_ic",
      productType: ProductType.studentsEquipments,
    ),
    HomeCategoryDisplay(
      color: blue,
      title: "materials".tr,
      iconPath: "students_equipments_ic",
      productType: ProductType.materials,
    ),
    HomeCategoryDisplay(
      color: orangeColor,
      title: "machines".tr,
      iconPath: "students_equipments_ic",
      productType: ProductType.machines,
    ),
    HomeCategoryDisplay(
      color: blue,
      title: "devices".tr,
      iconPath: "students_equipments_ic",
      productType: ProductType.devices,
    ),
    HomeCategoryDisplay(
      color: orangeColor,
      title: "consumables".tr,
      iconPath: "students_equipments_ic",
      productType: ProductType.consumables,
    ),
    HomeCategoryDisplay(
      color: blue,
      title: "orthodontics".tr,
      iconPath: "students_equipments_ic",
      productType: ProductType.orthodontics,
    ),
    HomeCategoryDisplay(
      color: orangeColor,
      title: "medical_clothes".tr,
      iconPath: "students_equipments_ic",
      productType: ProductType.medicalClothes,
    ),
    HomeCategoryDisplay(
      color: blue,
      title: "files_burs".tr,
      iconPath: "students_equipments_ic",
      productType: ProductType.filesBurs,
    ),
  ];

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

  @override
  void onLogin() {
    emit(HomeInitial());
  }

  @override
  void onLogout() {
    emit(HomeInitial());
  }
}
