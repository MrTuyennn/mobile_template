import 'package:core/core.dart';
import 'package:home/data/responses/response.dart';
import 'package:home/domain/entities/entities.dart';
import 'package:home/domain/repository/home_category_repo.dart';

part 'home_category_repo_impl_endpoint.dart';

class HomeCategoryRepoImpl implements HomeCategoryRepo {
  const HomeCategoryRepoImpl({required this.restClientProvider});

  final RestClientProvider restClientProvider;

  @override
  Future<Iterable<IDogEntities>> getHomeCategory() async {
    final client = restClientProvider();
    final reponse = await client.get(EndPoint.breed);
    return DogResponse.fromJson(reponse.data).data;
  }
}
