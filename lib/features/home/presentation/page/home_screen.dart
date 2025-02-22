import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ibn_sina_flutter/core/ui/loading/loading_widget.dart';
import 'package:ibn_sina_flutter/features/home/business_logic/home_cubit.dart';
import 'package:ibn_sina_flutter/features/home/presentation/widgets/home_slider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        HomeCubit cubit = BlocProvider.of(context);
        return Scaffold(
          body: Column(
            children: [
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
