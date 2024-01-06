import 'package:front/models/book.dart';

import 'settings.dart';

class BooksRepository {
  final Settings _settings;

  BooksRepository(this._settings);

  Future<List<Book>?> getBooks() async {
    var dio = _settings.provideDio();
    var response = await dio.get("/books");
    try {
      if (response.statusCode != 200) {
        return null;
      }
      var data = List<Map<String, dynamic>>.from(response.data);
      var processedData = data.map((e) => Book.fromJson(e)).toList();
      return processedData;
    } on Exception {
      return null;
    }
  }
}
