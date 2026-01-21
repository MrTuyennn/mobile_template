import 'package:flutter/foundation.dart';

@immutable
abstract class IHomeCategoryEntities {
  const IHomeCategoryEntities({this.title = '', this.description = ''});

  final String title;
  final String description;
}

class HomeCategoryEntities extends IHomeCategoryEntities {
  const HomeCategoryEntities({super.title, super.description});
}
