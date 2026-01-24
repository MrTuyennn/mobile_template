import 'package:core/core.dart';
import 'package:home/domain/entities/entities.dart';
import 'package:home/domain/repository/home_category_repo.dart';

final class GetHomeCategoryUsecase
    extends NoParamsUseCase<Result<Iterable<IDogEntities>>> {
  const GetHomeCategoryUsecase({required this.homeCategoryRepo});
  final HomeCategoryRepo homeCategoryRepo;

  @override
  Future<Result<Iterable<IDogEntities>>> call() {
    return Result.guardFuture(() => homeCategoryRepo.getHomeCategory());
  }
}
