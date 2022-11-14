class LoginDataModel {
  final String accessToken;

  const LoginDataModel({
    required this.accessToken,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LoginDataModel &&
          runtimeType == other.runtimeType &&
          accessToken == other.accessToken);

  @override
  int get hashCode => accessToken.hashCode;

  @override
  String toString() {
    return 'LoginDataModel{' + ' accessToken: $accessToken,' + '}';
  }

  LoginDataModel copyWith({
    String? accessToken,
  }) {
    return LoginDataModel(
      accessToken: accessToken ?? this.accessToken,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'access_token': this.accessToken,
    };
  }

  factory LoginDataModel.fromMap(Map<String, dynamic> map) {
    return LoginDataModel(
      accessToken: map['access_token'] as String,
    );
  }
}
