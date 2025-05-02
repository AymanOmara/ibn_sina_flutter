import 'package:dio/dio.dart';
import 'package:domain/locale_storage/i_user_local.dart';

class HeaderInterceptor extends InterceptorsWrapper {
  final IUserLocal userLocal;

  HeaderInterceptor(
    this.userLocal,
  );

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    Map<String, dynamic> headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json, text/plain, */*',
    };
    options.headers.addAll(headers);
    super.onRequest(options, handler);
  }
}
