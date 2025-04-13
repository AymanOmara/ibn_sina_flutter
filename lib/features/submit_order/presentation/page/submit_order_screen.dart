import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:ibn_sina_flutter/core/helper/utils.dart';
import 'package:ibn_sina_flutter/core/ui/ecis_text_field.dart';
import 'package:ibn_sina_flutter/core/ui/loading/sina_loading_button.dart';
import 'package:ibn_sina_flutter/core/ui/theme/colors.dart';
import 'package:ibn_sina_flutter/core/ui/time_picker.dart';
import 'package:ibn_sina_flutter/features/submit_order/business_logic/submit_order_cubit.dart';
import 'package:ibn_sina_flutter/features/submit_order/presentation/page/payment_toggle_button.dart';
import 'package:ibn_sina_flutter/features/submit_order/presentation/widgets/government_drop_down.dart';

class SubmitOrderScreen extends StatelessWidget {
  SubmitOrderScreen({super.key});

  static final formKey = GlobalKey<FormState>();
  final startTimeController = TextEditingController();
  final endTimeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SubmitOrderCubit, SubmitOrderState>(
      listener: (context, state) {
        if (state is SubmitOrderResult) {
          if (state.success) {
            Get.snackbar(
              "success".tr,
              "order_created_successfully".tr,
              backgroundColor: Colors.green,
            );
          } else {
            Get.snackbar(
              "error".tr,
              state.message,
              backgroundColor: Colors.red,
            );
          }
        }
      },
      builder: (context, state) {
        SubmitOrderCubit cubit = BlocProvider.of(context);
        return Dialog(
          elevation: 0,
          backgroundColor: Colors.white,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 10,
            ),
            child: Form(
              key: formKey,
              child: SingleChildScrollView(
                child: Column(
                  spacing: 10,
                  children: [
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            Get.back();
                          },
                          child: Container(
                            padding: EdgeInsets.all(
                              10,
                            ),
                            decoration: BoxDecoration(
                              color: blue,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.close,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Spacer(),
                        Text(
                          "make_order".tr,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Spacer(),
                        Container(
                          padding: EdgeInsets.all(
                            20,
                          ),
                          decoration: BoxDecoration(
                            color: blue,
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: AssetImage(
                                "assets/images/white_bag.png",
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    GovernorateDropDown(
                      onSelected: (value) {
                        cubit.orderEntity.governorate = value;
                      },
                    ),
                    SinaTextField(
                      title: "address".tr,
                      onChanged: (address) {
                        cubit.orderEntity.address = address;
                      },
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: TimePickerWidget(
                            initialDate: cubit.startTime,
                            title: "start_time".tr,
                            controller: startTimeController,
                            onChange: (startTime) {
                              startTimeController.text = startTime;
                              cubit.updateStartTime(startTime);
                            },
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: TimePickerWidget(
                            initialDate: cubit.endTime,
                            title: "end_time".tr,
                            controller: endTimeController,
                            onChange: (endTime) {
                              endTimeController.text = endTime;
                              cubit.updateEndTime(endTime);
                            },
                          ),
                        )
                      ],
                    ),
                    SinaTextField(
                      keyboardType: TextInputType.phone,
                      title: "phone_number".tr,
                      onChanged: (phone) {
                        cubit.orderEntity.phoneNumber = phone;
                      },
                      validator: Validator.validatePhone,
                    ),
                    Text(
                      "${"total_price".tr} ${cubit.totalAmount()} ${"egp".tr}",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            "${"shipping_cairo".tr} : 70 ${"egp".tr}",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            "${"shipping_outside_cairo".tr} : 70 ${"egp".tr}",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                    PaymentToggleButton(
                      selectedIndex: cubit.selectedPaymentIndex,
                      onChange: (index) {
                        cubit.updatePaymentIndex(index);
                      },
                    ),
                    InkWell(
                      onTap: () {
                        cubit.submitOrder();
                      },
                      child: SinaLoadingButton(
                        loadingState: cubit.loadingState,
                        child: Container(
                          width: double.infinity,
                          alignment: Alignment.center,
                          height: 50,
                          decoration: BoxDecoration(
                            color: orangeColor,
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: Text(
                            "make_order".tr,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
