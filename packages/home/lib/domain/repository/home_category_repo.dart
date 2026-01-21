import 'package:home/domain/entities/home_category_entities.dart';

abstract interface class HomeCategoryRepo {
  Future<IHomeCategoryEntities> getHomeCategory();
}
