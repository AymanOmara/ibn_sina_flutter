import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ibn_sina_flutter/core/ui/loading/loading_widget.dart';
import 'package:ibn_sina_flutter/features/home/business_logic/home_cubit.dart';
import 'package:ibn_sina_flutter/features/home/presentation/widgets/drawer/sina_navigation_drawer.dart';
import 'package:ibn_sina_flutter/features/home/presentation/widgets/home_slider/home_slider.dart';
import 'package:ibn_sina_flutter/features/home/presentation/widgets/home_top_bar.dart';

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
          drawer: SinaNavigationDrawer(),
          body: Column(
            children: [
              HomeTopBar(
                onMenuPressed: () {
                  _scaffoldKey.currentState?.openDrawer();
                },
              ),
              LoadingWidget(
                loadingState: cubit.loadingState,
                successWidget: HomeSlider(
                  images: cubit.banners,
                ),
                onRetry: cubit.fetchBanners,
              )
            ],
          ),
        );
      },
    );
  }
}
