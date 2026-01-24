import '../entities/dog_entities.dart';

abstract interface class HomeCategoryRepo {
  Future<Iterable<IDogEntities>> getHomeCategory();
}
