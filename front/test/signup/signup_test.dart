import 'package:flutter_test/flutter_test.dart';
import 'package:front/data/auth_repository.dart';
import 'package:front/data/settings.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../utils.dart';
import 'signup_test.mocks.dart';

@GenerateMocks([Settings])
void main() async {
  final (dio, dioAdapter) = testDio();
  test('test 200 response', () async {
    MockSettings settings = MockSettings();
    when(settings.provideDio()).thenReturn(dio);
    final json = await getMappingData("auth/signup.json");
    dioAdapter.onPost("/signup", (request) async {
      request.reply(200, json, headers: {
        "Content-Type": ["application/json"]
      });
    });
    final repo = AuthServiceImpl(dio: dio);
    var (token, _) = await repo.signup("", "", "", "", "", "");
    assert(token?.isNotEmpty == true);
  });
}
