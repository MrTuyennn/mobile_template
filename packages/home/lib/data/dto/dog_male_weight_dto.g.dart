// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dog_male_weight_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DogMaleWeightDto _$DogMaleWeightDtoFromJson(Map<String, dynamic> json) =>
    DogMaleWeightDto(
      max: (json['max'] as num?)?.toInt() ?? 0,
      min: (json['min'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$DogMaleWeightDtoToJson(DogMaleWeightDto instance) =>
    <String, dynamic>{'min': instance.min, 'max': instance.max};
