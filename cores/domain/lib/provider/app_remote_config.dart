



import 'package:domain/entity/mini_app_configure.dart';

abstract class AppRemoteConfig {
  Future<void> fetchData();
  Future<List<MiniAppConfigure>> getMiniAppConfig();
}