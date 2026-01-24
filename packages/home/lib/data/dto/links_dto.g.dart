// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'links_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LinksDto _$LinksDtoFromJson(Map<String, dynamic> json) => LinksDto(
  self: json['self'] as String? ?? '',
  current: json['current'] as String? ?? '',
  next: json['next'] as String? ?? '',
  last: json['last'] as String? ?? '',
);

Map<String, dynamic> _$LinksDtoToJson(LinksDto instance) => <String, dynamic>{
  'self': instance.self,
  'current': instance.current,
  'next': instance.next,
  'last': instance.last,
};
