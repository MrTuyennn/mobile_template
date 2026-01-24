import 'package:home/data/dto/dto.dart';
import 'package:home/domain/entities/entities.dart';
import 'package:json_annotation/json_annotation.dart';

final class DogAttributesConverter
    extends JsonConverter<IDogAttributes, Map<String, dynamic>> {
  const DogAttributesConverter();

  @override
  IDogAttributes fromJson(Map<String, dynamic> json) {
    return DogAttributesDto.fromJson(json).toEntity();
  }

  @override
  Map<String, dynamic> toJson(IDogAttributes object) {
    return DogAttributesDto(
      name: object.name,
      description: object.description,
      hypoallergenic: object.hypoallergenic,
      life: object.dogLife,
      maleWeight: object.dogMaleWeight,
      femaleWeight: object.dogFemaleWeight,
    ).toJson();
  }
}
