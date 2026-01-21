import 'package:core/core.dart';
import 'package:home/domain/entities/entities.dart';
import 'package:home/domain/repository/home_category_repo.dart';

final class GetHomeCategoryUsecase
    extends NoParamsUseCase<Result<IHomeCategoryEntities>> {
  const GetHomeCategoryUsecase({required this.homeCategoryRepo});
  final HomeCategoryRepo homeCategoryRepo;

  @override
  Future<Result<IHomeCategoryEntities>> call() {
    return Result.guardFuture(() => homeCategoryRepo.getHomeCategory());
  }
}
