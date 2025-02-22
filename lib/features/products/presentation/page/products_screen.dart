import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ibn_sina_flutter/core/ui/loading/loading_widget.dart';
import 'package:ibn_sina_flutter/core/ui/sina_top_navigation_bar.dart';
import 'package:ibn_sina_flutter/features/products/business_logic/products_cubit.dart';
import 'package:ibn_sina_flutter/features/products/presentation/widgets/product_widget.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductsCubit, ProductsState>(
      listener: (context, state) {},
      builder: (context, state) {
        ProductsCubit cubit = BlocProvider.of(context);
        return Scaffold(
          body: Column(
            children: [
              SinaTopNavigationBar(
                title: cubit.category.title,
              ),
              Expanded(
                child: LoadingWidget(
                  loadingState: cubit.loading,
                  successWidget: Expanded(
                    child: SingleChildScrollView(
                      child: Wrap(
                        spacing: 20,
                        runSpacing: 10,
                        children: cubit.products
                            .map((e) => ProductWidget(
                                  product: e,
                                ))
                            .toList(),
                      ),
                    ),
                  ),
                  onRetry: cubit.fetchProducts,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
