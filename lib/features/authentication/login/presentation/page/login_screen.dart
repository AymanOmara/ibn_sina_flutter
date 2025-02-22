import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:ibn_sina_flutter/core/ui/ecis_text_field.dart';
import 'package:ibn_sina_flutter/core/ui/loading/sina_loading_button.dart';
import 'package:ibn_sina_flutter/core/ui/theme/colors.dart';
import 'package:ibn_sina_flutter/features/authentication/login/business_logic/login_cubit.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({
    super.key,
  });

  static final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginResult) {
          state.result.fold(
            onSuccess: (data) {
              if(!data){
                Get.snackbar(
                    "error".tr,
                    "invalid_login".tr,
                    backgroundColor: Colors.red
                );
              }else{
                Get.snackbar(
                    "success".tr,
                    "login_success".tr,
                    backgroundColor: Colors.red
                );
              }
            },
            onFailure: (e) {
              Get.snackbar(
                "error".tr,
                e.message,
                backgroundColor: Colors.red
              );
            },
          );
        }
      },
      builder: (context, state) {
        LoginCubit cubit = BlocProvider.of(context);
        return Scaffold(
          body: SafeArea(
            child: Form(
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  spacing: 20,
                  children: [
                    SinaTextField(
                      title: "email".tr,
                      onChanged: (email) {
                        cubit.email = email;
                      },
                    ),
                    SinaTextField(
                      title: "password".tr,
                      obscureText: true,
                      onChanged: (password) {
                        cubit.password = password;
                      },
                    ),
                    SinaLoadingButton(
                      loadingState: cubit.loading,
                      child: InkWell(
                        onTap: () {
                          cubit.submit();
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: orangeColor,
                          ),
                          child: Text(
                            "login".tr,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ),
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
