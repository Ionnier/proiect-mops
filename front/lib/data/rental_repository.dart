import 'package:front/data/settings.dart';
import 'package:front/models/rentedbook.dart';

class RentalRepository {
  final Settings _settings;

  RentalRepository(this._settings);

  Future<List<RentedBook>?> getRentedBooks() async {
    var dio = _settings.provideDio();
    var response = await dio.get("/rentals");
    try {
      if (response.statusCode != 200) {
        return null;
      }
      var data = List<Map<String, dynamic>>.from(response.data);
      var processedData = data.map((e) => RentedBook.fromJson(e)).toList();
      return processedData;
    } on Exception {
      return null;
    }
  }
}
