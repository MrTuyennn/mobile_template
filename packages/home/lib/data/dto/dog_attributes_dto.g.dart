// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dog_attributes_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DogAttributesDto _$DogAttributesDtoFromJson(Map<String, dynamic> json) =>
    DogAttributesDto(
      name: json['name'] as String? ?? '',
      description: json['description'] as String? ?? '',
      hypoallergenic: json['hypoallergenic'] as bool? ?? false,
      life: json['life'] == null
          ? const DogLife()
          : const DogLifeConverter().fromJson(
              json['life'] as Map<String, dynamic>,
            ),
      maleWeight: json['male_weight'] == null
          ? const DogMaleWeight()
          : const DogMaleWeightConverter().fromJson(
              json['male_weight'] as Map<String, dynamic>,
            ),
      femaleWeight: json['female_weight'] == null
          ? const DogFemaleWeight()
          : const DogFemaleWeightConverter().fromJson(
              json['female_weight'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$DogAttributesDtoToJson(DogAttributesDto instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'hypoallergenic': instance.hypoallergenic,
      'life': const DogLifeConverter().toJson(instance.life),
      'male_weight': const DogMaleWeightConverter().toJson(instance.maleWeight),
      'female_weight': const DogFemaleWeightConverter().toJson(
        instance.femaleWeight,
      ),
    };
