import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:home/domain/entities/entities.dart';

part 'pagination_dto.g.dart';

extension PaginationDtoX on PaginationDto {
  IPagination toEntity() {
    return Pagination(current: current, records: records);
  }
}

@JsonSerializable(fieldRename: FieldRename.snake)
final class PaginationDto {
  const PaginationDto({this.current = 0, this.records = 0});

  factory PaginationDto.fromJson(Map<String, dynamic> json) =>
      _$PaginationDtoFromJson(json);

  final int current;
  final int records;

  Map<String, dynamic> toJson() => _$PaginationDtoToJson(this);
}
