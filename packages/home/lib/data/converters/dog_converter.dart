import 'package:home/data/dto/dto.dart';
import 'package:home/domain/entities/entities.dart';
import 'package:json_annotation/json_annotation.dart';

final class DogConverter
    extends JsonConverter<IDogEntities, Map<String, dynamic>> {
  const DogConverter();
  @override
  IDogEntities fromJson(Map<String, dynamic> json) {
    return DogDto.fromJson(json).toEntity();
  }

  @override
  Map<String, dynamic> toJson(IDogEntities object) {
    return DogDto(
      id: object.id,
      type: object.type,
      attributes: object.dogAttributes,
    ).toJson();
  }
}
