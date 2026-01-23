import 'package:home/data/dto/dto.dart';
import 'package:home/domain/entities/entities.dart';
import 'package:json_annotation/json_annotation.dart';

final class DogLifeConverter
    extends JsonConverter<IDogLife, Map<String, dynamic>> {
  const DogLifeConverter();

  @override
  IDogLife fromJson(Map<String, dynamic> json) {
    return DogLifeDto.fromJson(json).toEntity();
  }

  @override
  Map<String, dynamic> toJson(IDogLife object) {
    return DogLifeDto(min: object.min, max: object.max).toJson();
  }
}
