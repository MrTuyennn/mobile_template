import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:home/domain/entities/entities.dart';

part 'links_dto.g.dart';

extension LinksDtoX on LinksDto {
  ILinks toEntity() {
    return Links(self: self, current: current, next: next, last: last);
  }
}

@JsonSerializable(fieldRename: FieldRename.snake)
final class LinksDto {
  const LinksDto({
    this.self = '',
    this.current = '',
    this.next = '',
    this.last = '',
  });

  factory LinksDto.fromJson(Map<String, dynamic> json) =>
      _$LinksDtoFromJson(json);

  final String self;
  final String current;
  final String next;
  final String last;

  Map<String, dynamic> toJson() => _$LinksDtoToJson(this);
}
