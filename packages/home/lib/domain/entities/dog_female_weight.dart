import 'package:flutter/foundation.dart';

@immutable
abstract class IDogFemaleWeight {
  const IDogFemaleWeight({this.max = 0, this.min = 0});
  final int max;
  final int min;
}

class DogFemaleWeight extends IDogFemaleWeight {
  const DogFemaleWeight({super.max, super.min});
}
