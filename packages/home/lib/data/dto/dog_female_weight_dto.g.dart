// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dog_female_weight_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DogFemaleWeightDto _$DogFemaleWeightDtoFromJson(Map<String, dynamic> json) =>
    DogFemaleWeightDto(
      max: (json['max'] as num?)?.toInt() ?? 0,
      min: (json['min'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$DogFemaleWeightDtoToJson(DogFemaleWeightDto instance) =>
    <String, dynamic>{'min': instance.min, 'max': instance.max};
