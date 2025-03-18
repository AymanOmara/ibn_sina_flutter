import 'package:domain/features/products/entity/fetch_product_request.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ibn_sina_flutter/core/di/injector.dart';
import 'package:ibn_sina_flutter/core/routing/app_routes.dart';
import 'package:ibn_sina_flutter/core/ui/loading/loading_widget.dart';
import 'package:ibn_sina_flutter/features/home/business_logic/home_cubit.dart';
import 'package:ibn_sina_flutter/features/home/display/product_type.dart';
import 'package:ibn_sina_flutter/features/home/presentation/widgets/drawer/sina_drawer_cubit.dart';
import 'package:ibn_sina_flutter/features/home/presentation/widgets/drawer/sina_navigation_drawer.dart';
import 'package:ibn_sina_flutter/features/home/presentation/widgets/home_category_widget.dart';
import 'package:ibn_sina_flutter/features/home/presentation/widgets/home_slider/home_slider.dart';
import 'package:ibn_sina_flutter/features/home/presentation/widgets/home_top_bar.dart';
import 'package:ibn_sina_flutter/features/products/display/product_list_params.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        HomeCubit cubit = BlocProvider.of(context);
        return Scaffold(
          key: _scaffoldKey,
          drawer: SinaNavigationDrawer(
            userLoggedInState: cubit,
          ),
          body: Column(
            children: [
              HomeTopBar(
                onMenuPressed: () {
                  _scaffoldKey.currentState?.openDrawer();
                },
              ),
              Visibility(
                visible: getIt<SinaDrawerCubit>().isUserLoggedIn,
                child: IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, AppRoutes.cart);
                  },
                  icon: Icon(Icons.add_shopping_cart),
                ),
              ),
              LoadingWidget(
                loadingState: cubit.loadingState,
                successWidget: HomeSlider(
                  images: cubit.banners,
                ),
                onRetry: cubit.fetchBanners,
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Wrap(
                    spacing: 10,
                    runSpacing: 20,
                    children: cubit.categories
                        .map(
                          (category) => InkWell(
                            onTap: () {
                              var request = FetchProductsRequest()
                                ..categoryName = category.productType.type;
                              if (category.productType !=
                                  ProductType.studentsEquipments) {
                                Navigator.of(context).pushNamed(
                                  AppRoutes.products,
                                  arguments: ProductListParams(
                                    request: request,
                                    display: category,
                                  ),
                                );
                              } else {
                                Navigator.of(context).pushNamed(
                                  AppRoutes.studentEquipments,
                                  arguments: category,
                                );
                              }
                            },
                            child: HomeCategoryWidget(
                              category: category,
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
