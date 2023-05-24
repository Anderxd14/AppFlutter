// ignore_for_file: file_names

class TokenManager {
  late String _token;

  static final TokenManager _instance = TokenManager._internal();

  factory TokenManager() {
    return _instance;
  }

  TokenManager._internal();

  String get token => _token;

  void setToken(String token) {
    _token = token;
  }
}
