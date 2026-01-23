import 'package:home/data/dto/dto.dart';
import 'package:home/domain/entities/entities.dart';
import 'package:json_annotation/json_annotation.dart';

final class DogMaleWeightConverter
    extends JsonConverter<IDogMaleWeight, Map<String, dynamic>> {
  const DogMaleWeightConverter();

  @override
  IDogMaleWeight fromJson(Map<String, dynamic> json) {
    return DogMaleWeightDto.fromJson(json).toEntity();
  }

  @override
  Map<String, dynamic> toJson(IDogMaleWeight object) {
    return DogMaleWeightDto(max: object.max, min: object.min).toJson();
  }
}
