import 'package:dio/dio.dart';

class AuthRepository {
  static final AuthRepository _singleton = AuthRepository._internal();
  AuthRepository._internal();
  factory AuthRepository() {
    return _singleton;
  }
  String? jwtKey;

  Future<String?> login(String email, String password) async {
    var dio = provideDio();
    try {
      var response = await dio.post('/login', data: {
        'email': email,
        'password': password,
      });
      if (response.statusCode != 200) {
        return "Response = ${response.statusCode}";
      }
      var data = response.data;
      var key = data["token"];
      if (key == null) {
        return "No token found";
      }
      jwtKey = key;
      return null;
    } on Exception {
      return "Random error occured";
    }
  }

  Dio provideDio() {
    Map<String, dynamic> headers = {};
    if (jwtKey != null) {
      headers.addAll({"Authorization": "Bearer ${jwtKey!}"});
    }
    headers.addAll({"Accept": "application/json"});
    return Dio(BaseOptions(
      baseUrl: "http://localhost:8080/api",
      receiveDataWhenStatusError: true,
      validateStatus: (status) => true,
      headers: headers,
    ));
  }
}
