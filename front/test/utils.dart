import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:path/path.dart';

Future<dynamic> getMappingData(String mappingFile,
    [String? part2, String? part3, String? part4]) async {
  var file = join(Directory.current.parent.path, "mockserver", "__files",
      "bodyFiles", mappingFile, part2, part3, part4);
  var data = await File(file).readAsString();
  return Future.value(data);
}

(Dio, DioAdapter) testDio() {
  final dio = Dio(
    BaseOptions(
      receiveDataWhenStatusError: true,
      validateStatus: (value) => true,
    ),
  );
  final dioAdapter =
      DioAdapter(dio: dio, matcher: const UrlRequestMatcher(matchMethod: true));
  dio.httpClientAdapter = dioAdapter;
  return (dio, dioAdapter);
}
