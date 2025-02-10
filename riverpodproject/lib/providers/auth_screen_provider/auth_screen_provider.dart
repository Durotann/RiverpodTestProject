import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpodproject/models/auth_screen_model/auth_screen_model.dart';
import 'package:riverpodproject/providers/base_option_request.dart';

part "auth_screen_provider.g.dart";

@riverpod
class AuthScreenProvider extends _$AuthScreenProvider {
  @override
  AuthScreenModel build() {
    return AuthScreenModel();
  }

  Future<void> phoneSend(String phone) async {
    final Dio dio = Dio();
    await dio.post(
      "",
      data: {
        "phone": phone,
      },
    );

    state = state.copyWith(status: AuthScreenEnum.phoneSend);
  }
}
