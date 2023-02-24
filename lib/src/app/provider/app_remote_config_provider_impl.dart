



import 'dart:convert';

import 'package:domain/entity/mini_app_configure.dart';
import 'package:domain/provider/app_remote_config.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:domain/extension/list_extension.dart';
class AppRemoteConfigProviderImpl implements AppRemoteConfig{
  static const PROJECT_KEY = 'project_configs';
  static const LIST_APP_CONFIGURE_KEY = 'list_mini_app';
  final FirebaseRemoteConfig _remoteConfig;
  AppRemoteConfigProviderImpl._(this._remoteConfig);

  static Future<AppRemoteConfigProviderImpl> init() async {
    final remoteConfig = FirebaseRemoteConfig.instance;
    await remoteConfig.setConfigSettings(RemoteConfigSettings(
      fetchTimeout: const Duration(minutes: 1),
      minimumFetchInterval: const Duration(minutes: 1),
    ));
    return AppRemoteConfigProviderImpl._(remoteConfig);
  }

  @override
  Future<void> fetchData() {
    return _remoteConfig.fetchAndActivate();
  }

  @override
  Future<List<MiniAppConfigure>> getMiniAppConfig() async {
    final remoteValue =   _remoteConfig.getValue(LIST_APP_CONFIGURE_KEY);
    final listJson = jsonDecode(remoteValue.asString()) as List;
    return listJson.toListAppConfigure();
  }

}