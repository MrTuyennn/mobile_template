import 'package:home/data/dto/dto.dart';
import 'package:home/domain/entities/entities.dart';
import 'package:json_annotation/json_annotation.dart';

final class DogFemaleWeightConverter
    extends JsonConverter<IDogFemaleWeight, Map<String, dynamic>> {
  const DogFemaleWeightConverter();
  @override
  IDogFemaleWeight fromJson(Map<String, dynamic> json) {
    return DogFemaleWeightDto.fromJson(json).toEntity();
  }

  @override
  Map<String, dynamic> toJson(IDogFemaleWeight object) {
    return DogFemaleWeightDto(min: object.min, max: object.max).toJson();
  }
}
