import 'package:app_logger/logger.dart';
import 'package:core/core.dart';
import 'package:home/domain/entities/entities.dart';
import 'package:home/domain/repository/home_category_repo.dart';

part 'home_category_repo_impl_endpoint.dart';

class HomeCategoryRepoImpl implements HomeCategoryRepo {
  const HomeCategoryRepoImpl({required this.restClientProvider});

  final RestClientProvider restClientProvider;

  @override
  Future<IHomeCategoryEntities> getHomeCategory() async {
    final client = restClientProvider();
    final reponse = await client.get(EndPoint.breed);
    logger.d(reponse);
    return HomeCategoryEntities();
  }
}
