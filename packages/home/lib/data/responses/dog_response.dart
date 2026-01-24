import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:home/data/converters/converters.dart';
import 'package:home/domain/entities/entities.dart';

part 'dog_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, createToJson: false)
@LinksConverter()
@PaginationConverter()
@DogConverter()
final class DogResponse {
  const DogResponse({
    this.data = const [],
    this.links = const Links(),
    this.meta = const Pagination(),
  });

  factory DogResponse.fromJson(Map<String, dynamic> json) =>
      _$DogResponseFromJson(json);

  final Iterable<IDogEntities> data;
  final ILinks links;
  final IPagination meta;
}
