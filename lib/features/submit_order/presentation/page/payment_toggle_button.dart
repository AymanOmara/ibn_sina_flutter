import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaymentToggleButton extends StatelessWidget {
  const PaymentToggleButton({
    super.key,
    required this.selectedIndex,
    required this.onChange,
  });

  final int selectedIndex;
  final void Function(int) onChange;

  @override
  Widget build(BuildContext context) {
    return ToggleButtons(
      isSelected: [selectedIndex == 0, selectedIndex == 1],
      onPressed: (index) {
        onChange(index);
      },
      borderRadius: BorderRadius.circular(8),
      selectedColor: Colors.white,
      fillColor: Colors.blue,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            "payment_cash".tr,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            "payment_visa".tr,
          ),
        ),
      ],
    );
  }
}
