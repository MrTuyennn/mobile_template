// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dog_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DogResponse _$DogResponseFromJson(Map<String, dynamic> json) => DogResponse(
  data:
      (json['data'] as List<dynamic>?)?.map(
        (e) => const DogConverter().fromJson(e as Map<String, dynamic>),
      ) ??
      const [],
  links: json['links'] == null
      ? const Links()
      : const LinksConverter().fromJson(json['links'] as Map<String, dynamic>),
  meta: json['meta'] == null
      ? const Pagination()
      : const PaginationConverter().fromJson(
          json['meta'] as Map<String, dynamic>,
        ),
);
