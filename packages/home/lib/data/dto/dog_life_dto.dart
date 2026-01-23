import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:home/domain/entities/entities.dart';
part 'dog_life_dto.g.dart';

extension DogLifeDtoDtoX on DogLifeDto {
  IDogLife toEntity() {
    return DogLife(max: max, min: min);
  }
}

@JsonSerializable(fieldRename: FieldRename.snake)
final class DogLifeDto {
  const DogLifeDto({this.max = 0, this.min = 0});

  factory DogLifeDto.fromJson(Map<String, dynamic> json) =>
      _$DogLifeDtoFromJson(json);

  final int min;
  final int max;

  Map<String, dynamic> toJson() => _$DogLifeDtoToJson(this);
}
