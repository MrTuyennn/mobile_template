// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dog_life_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DogLifeDto _$DogLifeDtoFromJson(Map<String, dynamic> json) => DogLifeDto(
  max: (json['max'] as num?)?.toInt() ?? 0,
  min: (json['min'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$DogLifeDtoToJson(DogLifeDto instance) =>
    <String, dynamic>{'min': instance.min, 'max': instance.max};
