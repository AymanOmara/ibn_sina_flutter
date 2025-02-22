import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:ibn_sina_flutter/core/ui/loading/loading_widget.dart';
import 'package:ibn_sina_flutter/features/notifications/business_logic/notification_cubit.dart';
import 'package:ibn_sina_flutter/features/notifications/presentation/widgets/notification_widget.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotificationCubit, NotificationState>(
      builder: (context, state) {
        NotificationCubit cubit = BlocProvider.of(context);
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [

                  SizedBox(
                    height: 20,
                  ),
                  Flexible(
                    child: Container(
                      child: LoadingWidget(
                        emptyTitle: "empty_notifications".tr,
                        emptyImagePath: "assets/images/empty_notification_ic.svg",
                        loadingState: cubit.loading,
                        successWidget: Expanded(
                          child: Container(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                NotificationWidget(
                                  isRead: false,
                                ),
                                NotificationWidget(
                                  isRead: true,
                                ),
                              ],
                            ),
                          ),
                        ),
                        onRetry: cubit.fetchNotifications,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
