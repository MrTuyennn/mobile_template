import 'package:home/data/dto/dto.dart';
import 'package:home/domain/entities/entities.dart';
import 'package:json_annotation/json_annotation.dart';

final class LinksConverter extends JsonConverter<ILinks, Map<String, dynamic>> {
  const LinksConverter();

  @override
  ILinks fromJson(Map<String, dynamic> json) {
    return LinksDto.fromJson(json).toEntity();
  }

  @override
  Map<String, dynamic> toJson(ILinks object) {
    return LinksDto(
      self: object.self,
      current: object.current,
      next: object.next,
      last: object.last,
    ).toJson();
  }
}
