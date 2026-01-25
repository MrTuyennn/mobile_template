import 'package:app_logger/logger.dart';
import 'package:auto_route/auto_route.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:home/domain/entities/entities.dart';
import 'package:home/presentation/pages/home_page_viewmodel.dart';
import 'package:home/presentation/widgets/dog_card.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class HomePage extends HookConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loadingHomeState = useLoadingState();
    final homeViewModel = ref.watch(homePageViewmodelProvider.notifier);

    Future<Result<Iterable<IDogEntities>>>? homeCategory() async {
      return loadingHomeState.whileLoading(() {
        return homeViewModel.getHomeCategory().then((result) {
          if (!context.mounted) return result;
          result.ifFailure((e) {
            logger.e('====> ${e.message}');
          });
          return result;
        });
      });
    }

    useEffect(() {
      homeCategory();
      return null;
    }, []);

    return SafeArea(
      child: CustomScrollView(
        slivers: [
          HookConsumer(
            builder: (_, ref, _) {
              final isLoading = loadingHomeState.watchIsLoading;
              final homeCategoryResult = ref.watch(
                homePageViewmodelProvider.select((value) => value.homeCategory),
              );

              final homeCategory = homeCategoryResult?.when(
                success: (data) => data,
                failure: (_) => null,
              );

              if (isLoading && homeCategoryResult == null) {
                return SliverFillRemaining(child: Center(child: Text('First')));
              }

              if (homeCategory == null || homeCategory.isEmpty) {
                return SliverFillRemaining(
                  child: Center(child: Text('Seconds')),
                );
              }

              return SliverList.builder(
                itemCount: homeCategory.length,
                itemBuilder: (_, index) {
                  final dog = homeCategory.elementAt(index);
                  return DogCard(
                    dog: dog,
                    onClick: () {
                      AutoRouter.of(context).pushPath('/dog_detail/${dog.id}');
                    },
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
