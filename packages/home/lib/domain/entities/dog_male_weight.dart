import 'package:flutter/foundation.dart';

@immutable
abstract class IDogMaleWeight {
  const IDogMaleWeight({this.max = 0, this.min = 0});
  final int max;
  final int min;
}

class DogMaleWeight extends IDogMaleWeight {
  const DogMaleWeight({super.max, super.min});
}
