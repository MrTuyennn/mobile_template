import 'package:app_logger/logger.dart';
import 'package:core/core.dart';
import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:home/domain/entities/entities.dart';
import 'package:home/domain/repository/home_category_repo.dart';
import 'package:home/domain/usecase/get_home_category/get_home_category_usecase.dart';
import 'package:home/module/di.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_page_viewmodel.freezed.dart';
part 'home_page_viewmodel.g.dart';

@freezed
abstract class HomePageState with _$HomePageState {
  const factory HomePageState({Result<Iterable<IDogEntities>>? homeCategory}) =
      _HomePageState;
}

@riverpod
class HomePageViewmodel extends _$HomePageViewmodel {
  late final HomeCategoryRepo _categoryRepo;
  final ScrollController scrollController = ScrollController();

  Future<Result<Iterable<IDogEntities>>> getHomeCategory() {
    final usecase = GetHomeCategoryUsecase(homeCategoryRepo: _categoryRepo);
    return usecase().then((result) {
      state = state.copyWith(homeCategory: result);
      return result;
    });
  }

  @override
  HomePageState build() {
    _categoryRepo = ref.read<HomeCategoryRepo>(homerepo);
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        logger.i('====> Load more items');
      }
    });
    ref.onDispose(() {});
    return const HomePageState();
  }
}
