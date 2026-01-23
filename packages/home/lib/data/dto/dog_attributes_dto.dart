import 'package:home/data/converters/converters.dart';
import 'package:home/domain/entities/entities.dart';
import 'package:json_annotation/json_annotation.dart';

part 'dog_attributes_dto.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
@DogFemaleWeightConverter()
@DogMaleWeightConverter()
@DogLifeConverter()
final class DogAttributesDto {
  const DogAttributesDto({
    this.name = '',
    this.description = '',
    this.hypoallergenic = false,
    this.life = const DogLife(),
    this.maleWeight = const DogMaleWeight(),
    this.femaleWeight = const DogFemaleWeight(),
  });

  factory DogAttributesDto.fromJson(Map<String, dynamic> json) =>
      _$DogAttributesDtoFromJson(json);

  final String name;
  final String description;
  final bool hypoallergenic;
  final IDogLife life;
  final IDogMaleWeight maleWeight;
  final IDogFemaleWeight femaleWeight;

  Map<String, dynamic> toJson() => _$DogAttributesDtoToJson(this);
}
