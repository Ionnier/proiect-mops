import 'package:front/data/settings.dart';
import 'package:front/models/desk.dart';
import 'package:front/models/deskdetails.dart';
import 'package:front/models/interval.dart';

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

  Future<String?> book(List<Interval> intervals, Desk desk) async {
    var data = {"deskId": desk.id, "intervals": intervals};
    var response = await _settings.provideDio().post("/desks", data: data);
    try {
      if (response.statusCode == 200) {
        return null;
      }
      return "Received ${response.statusCode}";
    } on Exception catch (e) {
      return e.toString();
    }
  }

  Future<DeskDetails?> getDeskDetails(Desk desk) async {
    var response = await _settings.provideDio().get("/desks/${desk.id}");
    try {
      if (response.statusCode != 200) {
        return null;
      }
      var data = Map<String, dynamic>.from(response.data);
      return DeskDetails.fromJson(data);
    } on Exception {
      return null;
    }
  }
}
