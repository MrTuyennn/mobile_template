import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:home/data/converters/converters.dart';
import 'package:home/domain/entities/entities.dart';

part 'dog_dto.g.dart';

extension DogDtoX on DogDto {
  IDogEntities toEntity() {
    return DogEntities(id: id, type: type, dogAttributes: attributes);
  }
}

@JsonSerializable(fieldRename: FieldRename.snake)
@DogAttributesConverter()
final class DogDto {
  const DogDto({
    this.id = '',
    this.type = '',
    this.attributes = const DogAttributes(),
  });

  factory DogDto.fromJson(Map<String, dynamic> json) => _$DogDtoFromJson(json);

  final String id;
  final String type;
  final IDogAttributes attributes;

  Map<String, dynamic> toJson() => _$DogDtoToJson(this);
}
