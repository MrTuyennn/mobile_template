import 'package:home/data/dto/dto.dart';
import 'package:home/domain/entities/entities.dart';
import 'package:json_annotation/json_annotation.dart';

final class PaginationConverter
    extends JsonConverter<IPagination, Map<String, dynamic>> {
  const PaginationConverter();

  @override
  IPagination fromJson(Map<String, dynamic> json) {
    return PaginationDto.fromJson(json).toEntity();
  }

  @override
  Map<String, dynamic> toJson(IPagination object) {
    return PaginationDto(
      current: object.current,
      records: object.records,
    ).toJson();
  }
}
