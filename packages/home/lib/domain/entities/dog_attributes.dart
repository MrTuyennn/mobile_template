import 'package:home/domain/entities/entities.dart';

abstract class IDogAttributes {
  const IDogAttributes({
    this.name = '',
    this.description = '',
    this.hypoallergenic = false,
    this.dogLife = const DogLife(),
    this.dogFemaleWeight = const DogFemaleWeight(),
    this.dogMaleWeight = const DogMaleWeight(),
  });

  final String name;
  final String description;
  final bool hypoallergenic;
  final IDogLife dogLife;
  final IDogFemaleWeight dogFemaleWeight;
  final IDogMaleWeight dogMaleWeight;
}

class DogAttributes extends IDogAttributes {
  const DogAttributes({
    super.name,
    super.description,
    super.dogFemaleWeight,
    super.dogMaleWeight,
    super.dogLife,
    super.hypoallergenic,
  });
}
