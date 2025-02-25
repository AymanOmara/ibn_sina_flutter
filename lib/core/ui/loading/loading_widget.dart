import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ibn_sina_flutter/core/display/loading_state.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({
    super.key,
    required this.loadingState,
    required this.successWidget,
    required this.onRetry,
    this.emptyImagePath = "",
    this.emptyTitle = "",
    this.emptyWidget,
  });

  final Widget successWidget;
  final LoadingState loadingState;
  final void Function() onRetry;
  final String emptyImagePath;
  final String emptyTitle;
  final Widget? emptyWidget;

  @override
  Widget build(BuildContext context) {
    return switch (loadingState) {
      Loading() => _baseWidget(const CircularProgressIndicator()),
      Idle() => const SizedBox(),
      LoadingSuccess(data: final data) => !_isDataNotEmpty(data)
          ? emptyWidget ?? _emptyWidget()
          : _baseWidget(successWidget),
      LoadingException(exception: final exception) => _baseWidget(
          Column(
            children: [
              Text(
                exception.message,
              ),
              ElevatedButton(
                onPressed: () {
                  onRetry();
                },
                child: Text(
                  "retry".tr,
                ),
              )
            ],
          ),
        ),
    };
  }

  Widget _baseWidget(Widget stateRelatedWidget) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [stateRelatedWidget],
      ),
    );
  }

  bool _isDataNotEmpty(dynamic data) {
    if (data == null) {
      return false;
    }
    if (data is List && data.isEmpty) {
      return false;
    }
    return true;
  }

  Widget _emptyWidget() {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // SvgPicture.asset(
        //   emptyImagePath,
        // ),
        const SizedBox(
          height: 30,
        ),
        Text(
          emptyTitle,
        ),
      ],
    );
  }
}
