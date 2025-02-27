import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:ibn_sina_flutter/core/routing/app_routes.dart';
import 'package:ibn_sina_flutter/core/ui/sina_top_navigation_bar.dart';
import 'package:ibn_sina_flutter/core/ui/theme/colors.dart';
import 'package:ibn_sina_flutter/features/cart/business_logic/cart_cubit.dart';
import 'package:ibn_sina_flutter/features/cart/presentation/widgets/cart_widget.dart';
import 'package:ibn_sina_flutter/features/submit_order/presentation/page/submit_order_screen.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartCubit, CartState>(
      listener: (context, state) {},
      builder: (context, state) {
        CartCubit cubit = BlocProvider.of(context);
        return Scaffold(
          body: SafeArea(
            child: Column(
              children: [
                SinaTopNavigationBar(
                  title: "cart".tr,
                ),
                cubit.products.isEmpty
                    ? Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "no_products_in_cart".tr,
                              style: TextStyle(
                                  color: orangeColor,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16),
                            ),
                          ],
                        ),
                      )
                    : Expanded(
                        child: Column(
                          children: cubit.products
                              .map((e) => CartWidget(cart: e))
                              .toList(),
                        ),
                      ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () {
                        cubit.clear();
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: Get.width / 2 - 20,
                        constraints: BoxConstraints(minHeight: 46),
                        decoration: BoxDecoration(color: blue),
                        child: Text(
                          "empty_cart".tr,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          AppRoutes.order,
                        );
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: Get.width / 2 - 10,
                        constraints: BoxConstraints(minHeight: 46),
                        decoration: BoxDecoration(color: orangeColor),
                        child: Text(
                          "order_now".tr,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
