import 'package:dio/dio.dart';
import 'settings.dart';

class AuthRepository {
  final AuthService _authService;
  final Settings _settings;

  AuthRepository(this._authService, this._settings);

  Future<String?> login(String email, String password) async {
    var (jwt, error) = await _authService.login(email, password);
    if (error != null) {
      return Future.value(error);
    }
    if (jwt != null) {
      _settings.setApiKey(jwt);
    }
    return Future.value();
  }

  Future<String?> signup(String email, String password, String firstName,
      String lastName, String address, String ssn) async {
    var (jwt, error) = await _authService.signup(
        email, password, firstName, lastName, address, ssn);
    if (error != null) {
      return Future.value(error);
    }
    if (jwt != null) {
      _settings.setApiKey(jwt);
    }
    return Future.value();
  }
}

class AuthServiceImpl implements AuthService {
  final Dio dio;

  AuthServiceImpl({required this.dio});

  @override
  Future<(String?, String?)> login(String email, String password) async {
    try {
      var response = await dio.post('/login', data: {
        'email': email,
        'password': password,
      });
      if (response.statusCode != 200) {
        return (null, "Received statusCode=${response.statusCode}");
      }
      if (response.data == null) {
        return (null, "Received empty body");
      }
      return Future.value((response.data["token"] as String, null));
    } on Exception catch (e) {
      return (null, e.toString());
    }
  }

  @override
  Future<(String?, String?)> signup(String email, String password,
      String firstName, String lastName, String address, String ssn) async {
      var response = await dio.post('/signup', data: {
        'email': email,
        'password': password,
        "firstName": firstName,
        "lastName": lastName,
        "address": address,
        "ssn": ssn
      });
      if (response.statusCode != 200) {
        return (null, "Received statusCode=${response.statusCode}");
      }
    print(response);
      if (response.data == null) {
        return (null, "Received empty body");
      }
    return Future.value((response.data["token"] as String, null));
  } 
}

abstract class AuthService {
  Future<(String?, String?)> login(String email, String password);
  Future<(String?, String?)> signup(String email, String password,
      String firstName, String lastName, String address, String ssn);
}
