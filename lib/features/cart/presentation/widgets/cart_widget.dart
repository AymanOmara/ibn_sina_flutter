import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:domain/features/cart/entity/cart_entity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:ibn_sina_flutter/core/ui/theme/colors.dart';
import 'package:ibn_sina_flutter/features/cart/business_logic/cart_cubit.dart';

class CartWidget extends StatelessWidget {
  const CartWidget({
    super.key,
    required this.cart,
  });

  final CartEntity cart;

  @override
  Widget build(BuildContext context) {
    CartCubit cubit = context.watch();
    return Row(
      spacing: 10,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: Get.width / 4,
          child: Column(
            children: [
              CachedNetworkImage(
                imageUrl: cart.product.images.first,
                placeholder: (context, url) =>
                    const Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) =>
                    const Icon(Icons.error, size: 50),
                fit: BoxFit.fill,
              ),
              SizedBox(
                width: 20,
              ),
              Text(
                cart.product.productName,
                style: TextStyle(
                  color: orangeColor,
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
        SizedBox(
          child: Column(
            children: [
              Text("price".tr),
              Text(
                cart.product.price.toString(),
                style: TextStyle(
                  color: orangeColor,
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
        SizedBox(
          child: Column(
            children: [
              Text("quantity".tr),
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        cubit.addToCart(cart.product);
                      },
                      icon: Icon(Icons.add)),
                  Text(
                    cart.count.toString(),
                    style: TextStyle(
                      color: orangeColor,
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  IconButton(
                    onPressed: () {
                      cubit.removeFromCart(cart.product);
                    },
                    icon: Icon(Icons.minimize_outlined),
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
