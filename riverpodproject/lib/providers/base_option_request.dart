import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part "base_option_request.g.dart";

const baseUrl = '';
const socketUrl = '';

class BaseOptionRequests {
  Dio createDio() {
    final Dio dio = Dio(
      BaseOptions(
        baseUrl: '$baseUrl/api',
      ),
    );

    addInterceptor(dio);

    return dio;
  }

  void addInterceptor(Dio dio) {
    dio.interceptors.add(
      InterceptorsWrapper(
        onError: (e, handler) async {},
      ),
    );
  }
}

@riverpod
BaseOptionRequests baseOptionRequests(Ref ref) {
  return BaseOptionRequests();
}
