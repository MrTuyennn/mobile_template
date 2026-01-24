// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dog_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DogDto _$DogDtoFromJson(Map<String, dynamic> json) => DogDto(
  id: json['id'] as String? ?? '',
  type: json['type'] as String? ?? '',
  dogAttributes: json['dog_attributes'] == null
      ? const DogAttributes()
      : const DogAttributesConverter().fromJson(
          json['dog_attributes'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$DogDtoToJson(DogDto instance) => <String, dynamic>{
  'id': instance.id,
  'type': instance.type,
  'dog_attributes': const DogAttributesConverter().toJson(
    instance.dogAttributes,
  ),
};
