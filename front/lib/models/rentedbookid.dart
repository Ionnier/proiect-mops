import 'package:freezed_annotation/freezed_annotation.dart';

// required: associates our `book.dart` with the code generated by Freezed
part 'rentedbookid.freezed.dart';
// needed if serializable
part 'rentedbookid.g.dart';

@freezed
class RentedBookId with _$RentedBookId {
  const factory RentedBookId({
    required int inventoryId,
    required int userId,
    required int createdAt,
  }) = _RentedBookId;

  factory RentedBookId.fromJson(Map<String, Object?> json) =>
      _$RentedBookIdFromJson(json);
}
