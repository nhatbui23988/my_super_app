



import 'package:domain/provider/app_remote_config.dart';
import 'package:get/get.dart';
import 'package:my_super_app/src/app/provider/app_remote_config_provider_impl.dart';

class ProviderModule{

  static Future<void> init() async{
    final appRemoteConfig = await AppRemoteConfigProviderImpl.init();
    Get.put<AppRemoteConfig>(appRemoteConfig);
  }
}