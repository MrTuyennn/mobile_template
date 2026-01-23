import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:home/domain/entities/entities.dart';
part 'dog_male_weight_dto.g.dart';

extension DogMaleWeightDtoX on DogMaleWeightDto {
  IDogMaleWeight toEntity() {
    return DogMaleWeight(max: max, min: min);
  }
}

@JsonSerializable(fieldRename: FieldRename.snake)
final class DogMaleWeightDto {
  const DogMaleWeightDto({this.max = 0, this.min = 0});

  factory DogMaleWeightDto.fromJson(Map<String, dynamic> json) =>
      _$DogMaleWeightDtoFromJson(json);

  final int min;
  final int max;

  Map<String, dynamic> toJson() => _$DogMaleWeightDtoToJson(this);
}
