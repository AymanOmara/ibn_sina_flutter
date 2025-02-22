import 'package:cached_network_image/cached_network_image.dart';
import 'package:domain/features/products/entity/product_entity.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductWidget extends StatelessWidget {
  const ProductWidget({
    super.key,
    required this.product,
  });

  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: (Get.width - 30) / 2,
      child: Column(
        children: [
          CachedNetworkImage(
            imageUrl: product.images.first,
            placeholder: (context, url) =>
                const Center(child: CircularProgressIndicator()),
            errorWidget: (context, url, error) =>
                const Icon(Icons.error, size: 50),
            fit: BoxFit.fill,
          ),
          Text(
            product.productName,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
