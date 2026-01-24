import 'package:flutter/foundation.dart';

import 'dog_attributes.dart';

@immutable
abstract class IDogEntities {
  const IDogEntities({
    this.id = '',
    this.type = '',
    this.dogAttributes = const DogAttributes(),
  });

  final String id;
  final String type;
  final IDogAttributes dogAttributes;
}

class DogEntities extends IDogEntities {
  const DogEntities({super.id, super.type, super.dogAttributes});
}
