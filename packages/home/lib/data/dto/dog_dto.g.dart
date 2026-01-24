// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dog_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DogDto _$DogDtoFromJson(Map<String, dynamic> json) => DogDto(
  id: json['id'] as String? ?? '',
  type: json['type'] as String? ?? '',
  attributes: json['attributes'] == null
      ? const DogAttributes()
      : const DogAttributesConverter().fromJson(
          json['attributes'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$DogDtoToJson(DogDto instance) => <String, dynamic>{
  'id': instance.id,
  'type': instance.type,
  'attributes': const DogAttributesConverter().toJson(instance.attributes),
};
