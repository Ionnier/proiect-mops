import 'package:front/data/settings.dart';
import 'package:front/models/desk.dart';
import 'package:front/models/rentedbook.dart';

class DeskRepository {
  final Settings _settings;

  DeskRepository(this._settings);

  Future<List<Desk>?> getDesks() async {
    var dio = _settings.provideDio();
    var response = await dio.get("/desks");
    try {
      if (response.statusCode != 200) {
        return null;
      }
      var data = List<Map<String, dynamic>>.from(response.data);
      var processedData = data.map((e) => Desk.fromJson(e)).toList();
      return processedData;
    } on Exception {
      return null;
    }
  }
}
