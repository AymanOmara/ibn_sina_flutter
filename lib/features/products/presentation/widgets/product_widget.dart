import 'package:cached_network_image/cached_network_image.dart';
import 'package:domain/features/products/entity/product_entity.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ibn_sina_flutter/core/di/injector.dart';
import 'package:ibn_sina_flutter/core/routing/app_routes.dart';
import 'package:ibn_sina_flutter/features/cart/business_logic/cart_cubit.dart';
import 'package:ibn_sina_flutter/features/home/business_logic/home_cubit.dart';

class ProductWidget extends StatelessWidget {
  const ProductWidget({
    super.key,
    required this.product,
    required this.changeFavoriteStatus,
  });

  final ProductEntity product;
  final void Function(ProductEntity product) changeFavoriteStatus;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(
          AppRoutes.productDetails,
          arguments: product,
        );
      },
      child: SizedBox(
        width: (Get.width - 30) / 2,
        child: Column(
          children: [
            CachedNetworkImage(
              imageUrl: product.images.first,
              placeholder: (context, url) => const Center(
                child: CircularProgressIndicator(),
              ),
              errorWidget: (context, url, error) => Image.asset(
                "assets/images/app_square_logo.png",
              ),
              fit: BoxFit.fill,
            ),
            Text(
              product.productName,
              textAlign: TextAlign.center,
            ),
            Text(
              product.price.toString(),
              textAlign: TextAlign.center,
            ),
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    getIt<CartCubit>().addToCart(product);
                    getIt<HomeCubit>().incrementCartCount();
                    Get.snackbar(
                      "success".tr,
                      "product_added_to_cart".tr,
                      backgroundColor: Colors.green,
                    );
                  },
                  icon: Icon(
                    Icons.shopping_cart_outlined,
                    size: 50,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    changeFavoriteStatus(product);
                  },
                  icon: Icon(
                    product.isFavorite ? Icons.favorite : Icons.favorite_border,
                    size: 50,
                    color: product.isFavorite ? Colors.red : null,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
