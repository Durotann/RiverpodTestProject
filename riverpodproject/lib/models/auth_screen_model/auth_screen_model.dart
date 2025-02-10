// ignore_for_file: public_member_api_docs, sort_constructors_first
enum AuthScreenEnum {
  init,
  phoneSend,
  codeVerif,
}

class AuthScreenModel {
  final AuthScreenEnum status;
  final String phone;
  final int timerCount;
  AuthScreenModel({
    this.status = AuthScreenEnum.init,
    this.phone = '',
    this.timerCount = 60,
  });

  AuthScreenModel copyWith({
    AuthScreenEnum? status,
    String? phone,
    int? timerCount,
  }) {
    return AuthScreenModel(
      status: status ?? this.status,
      phone: phone ?? this.phone,
      timerCount: timerCount ?? this.timerCount,
    );
  }
}
