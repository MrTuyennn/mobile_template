import 'package:flutter/foundation.dart';

@immutable
abstract class IDogLife {
  const IDogLife({this.max = 0, this.min = 0});
  final int max;
  final int min;
}

class DogLife extends IDogLife {
  const DogLife({super.max, super.min});
}
