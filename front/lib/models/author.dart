import 'package:freezed_annotation/freezed_annotation.dart';

// required: associates our `book.dart` with the code generated by Freezed
part 'author.freezed.dart';
// needed if serializable
part 'author.g.dart';

@freezed
class Author with _$Author {
  const factory Author({
    required int authorId,
    required String name,
  }) = _Author;

  factory Author.fromJson(Map<String, Object?> json) => _$AuthorFromJson(json);
}
