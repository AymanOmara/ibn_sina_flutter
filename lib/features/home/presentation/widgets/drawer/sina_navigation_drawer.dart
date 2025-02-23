import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:ibn_sina_flutter/core/di/injector.dart';
import 'package:ibn_sina_flutter/core/routing/app_routes.dart';
import 'package:ibn_sina_flutter/core/ui/theme/colors.dart';
import 'package:ibn_sina_flutter/features/home/presentation/widgets/drawer/sina_drawer_cubit.dart';

class SinaNavigationDrawer extends StatelessWidget {
  const SinaNavigationDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<SinaDrawerCubit>(),
      child: BlocConsumer<SinaDrawerCubit, SinaDrawerState>(
        listener: (context, state) {
          if (state is SinaDrawerLogoutUser) {
            Get.snackbar(
              "success".tr,
              "logout_success".tr,
              backgroundColor: Colors.green,
            );
          } else if (state is SinaDrawerDeleteAccountResult) {
            state.result.fold(onSuccess: (data) {
              if (data) {
                Get.snackbar(
                  "success".tr,
                  "account_deleted_successfully".tr,
                  backgroundColor: Colors.green,
                );
              } else {
                Get.snackbar(
                  "error".tr,
                  "error".tr,
                  backgroundColor: Colors.red,
                );
              }
            }, onFailure: (e) {
              Get.snackbar(
                "error".tr,
                e.message,
                backgroundColor: Colors.red,
              );
            });
          }
        },
        builder: (context, state) {
          SinaDrawerCubit cubit = BlocProvider.of(context);
          return Container(
            width: Get.width * 0.5,
            height: Get.height - 20,
            decoration: BoxDecoration(
              color: orangeColor,
              borderRadius: BorderRadiusDirectional.only(
                topEnd: Radius.circular(50),
                bottomEnd: Radius.circular(50),
              ),
            ),
            child:
                cubit.isUserLoggedIn ? _loggedInUser(cubit) : _unLoggedInUser(),
          );
        },
      ),
    );
  }

  Widget _loggedInUser(SinaDrawerCubit cubit) {
    return Column(
      children: [
        SizedBox(
          height: Get.mediaQuery.padding.top + 20,
        ),
        Text(
          cubit.user?.userName ?? "",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        InkWell(
          onTap: () {
            Get.toNamed(AppRoutes.contactUs);
          },
          child: Container(
            alignment: Alignment.center,
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(
                  20,
                ),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "contact_us".tr,
                  style: TextStyle(
                      fontSize: 16,
                      color: orangeColor,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
        InkWell(
          onTap: () {
            cubit.logout();
          },
          child: Container(
            alignment: Alignment.center,
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(
                  20,
                ),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "logout".tr,
                  style: TextStyle(
                      fontSize: 16,
                      color: orangeColor,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
        InkWell(
          onTap: () {
            cubit.deleteAccount();
          },
          child: Container(
            alignment: Alignment.center,
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(
                  20,
                ),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "delete_account".tr,
                  style: TextStyle(
                      fontSize: 16,
                      color: orangeColor,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
        cubit.loading
            ? CircularProgressIndicator(
                color: Colors.white,
              )
            : SizedBox()
      ],
    );
  }

  Widget _unLoggedInUser() {
    return Column(
      children: [
        SizedBox(
          height: Get.mediaQuery.padding.top + 20,
        ),
        InkWell(
          onTap: () {
            Get.toNamed(AppRoutes.login);
          },
          child: Container(
            alignment: Alignment.center,
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(
                  20,
                ),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "login".tr,
                  style: TextStyle(
                      fontSize: 16,
                      color: orangeColor,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
        InkWell(
          onTap: () {
            Get.toNamed(AppRoutes.registration);
          },
          child: Container(
            alignment: Alignment.center,
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(
                  20,
                ),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "create_account".tr,
                  style: TextStyle(
                    fontSize: 16,
                    color: orangeColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
        InkWell(
          onTap: () {
            Get.toNamed(AppRoutes.contactUs);
          },
          child: Container(
            alignment: Alignment.center,
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(
                  20,
                ),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "contact_us".tr,
                  style: TextStyle(
                      fontSize: 16,
                      color: orangeColor,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
