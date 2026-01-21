import 'package:core/core.dart';
import 'package:home/data/repository/home_category_repo_impl.dart';
import 'package:home/domain/repository/home_category_repo.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final homerepo = Provider.autoDispose<HomeCategoryRepo>((ref) {
  return HomeCategoryRepoImpl(restClientProvider: ref.read(restClientProvider));
});
