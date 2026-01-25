import 'package:routes/src/deeplink_route_action.dart';

final class OpenDogDetailRouteAction
    extends DeepLinkActionModel<OpenDogDetailRouteData> {
  const OpenDogDetailRouteAction({super.routeData});

  static const String action = 'open_dog_detail';

  @override
  String get path => '/dog_detail/${routeData?.id}';
}

final class OpenDogDetailRouteData {
  const OpenDogDetailRouteData({required this.id});

  factory OpenDogDetailRouteData.fromMap(Map<String, List<String>> map) {
    return OpenDogDetailRouteData(id: map['id']?.firstOrNull ?? '');
  }

  final String? id;
}
