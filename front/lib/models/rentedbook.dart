import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:front/models/rentedbookid.dart';

import 'bookinventory.dart';

// required: associates our `book.dart` with the code generated by Freezed
part 'rentedbook.freezed.dart';
// needed if serializable
part 'rentedbook.g.dart';

@freezed
class RentedBook with _$RentedBook {
  const factory RentedBook(
      {required RentedBookId id,
      required BookInventory bookInventory,
      required String state,
      required int dueDate}) = _RentedBook;

  factory RentedBook.fromJson(Map<String, Object?> json) =>
      _$RentedBookFromJson(json);
}
