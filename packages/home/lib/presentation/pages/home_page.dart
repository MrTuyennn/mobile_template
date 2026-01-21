import 'package:app_logger/logger.dart';
import 'package:auto_route/auto_route.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:home/domain/entities/entities.dart';
import 'package:home/presentation/pages/home_page_viewmodel.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class HomePage extends HookConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loadingHomeState = useLoadingState();
    final homeViewModel = ref.read(homePageViewmodelProvider.notifier);

    Future<Result<IHomeCategoryEntities>>? homeCategory() async {
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
      Future.delayed(Duration(seconds: 2), () {
        homeCategory();
      });
      return null;
    }, []);

    return Scaffold(body: Center(child: Text('Get category')));
  }
}
