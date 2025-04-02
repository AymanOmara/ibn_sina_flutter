import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:ibn_sina_flutter/core/ui/loading/loading_widget.dart';
import 'package:ibn_sina_flutter/core/ui/sina_top_navigation_bar.dart';
import 'package:ibn_sina_flutter/features/favorites/business_logic/favorites_cubit.dart';
import 'package:ibn_sina_flutter/features/products/presentation/widgets/product_widget.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FavoritesCubit, FavoritesState>(
      listener: (context, state) {
        if (state is FavoritesRemoveResult) {
          if (state.success) {
            Get.snackbar(
              "success".tr,
              state.message,
              backgroundColor: Colors.green,
              colorText: Colors.white,
            );
          } else {
            Get.snackbar(
              "error".tr,
              state.message,
              backgroundColor: Colors.red,
              colorText: Colors.white,
            );
          }
        }
      },
      builder: (context, state) {
        FavoritesCubit cubit = BlocProvider.of(context);
        return Scaffold(
          body: Column(
            children: [
              SinaTopNavigationBar(
                title: "favorites".tr,
              ),
              Expanded(
                child: LoadingWidget(
                  loadingState: cubit.loading,
                  successWidget: Expanded(
                    child: SingleChildScrollView(
                      child: Wrap(
                        spacing: 20,
                        runSpacing: 10,
                        children: cubit.favorites
                            .map((e) => ProductWidget(
                                  product: e,
                                  changeFavoriteStatus: (product) {
                                    cubit.removeFromFavorite(product);
                                  },
                                ))
                            .toList(),
                      ),
                    ),
                  ),
                  onRetry: cubit.fetchFavorites,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
