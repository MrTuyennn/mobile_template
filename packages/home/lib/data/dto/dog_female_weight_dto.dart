import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:home/domain/entities/entities.dart';
part 'dog_female_weight_dto.g.dart';

extension DogFemaleWeightDtoX on DogFemaleWeightDto {
  IDogFemaleWeight toEntity() {
    return DogFemaleWeight(max: max, min: min);
  }
}

@JsonSerializable(fieldRename: FieldRename.snake)
final class DogFemaleWeightDto {
  const DogFemaleWeightDto({this.max = 0, this.min = 0});

  factory DogFemaleWeightDto.fromJson(Map<String, dynamic> json) =>
      _$DogFemaleWeightDtoFromJson(json);

  final int min;
  final int max;

  Map<String, dynamic> toJson() => _$DogFemaleWeightDtoToJson(this);
}
