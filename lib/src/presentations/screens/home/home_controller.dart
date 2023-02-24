import 'package:domain/entity/mini_app_configure.dart';
import 'package:domain/provider/app_remote_config.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:my_super_app/src/base/base_controller.dart';

class HomeBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController(Get.find()));
  }

}

class HomeController extends BaseController {
  final AppRemoteConfig _appRemoteConfig;

  HomeController(this._appRemoteConfig);

  RxList<MiniAppConfigure> listAppConfig = RxList();

  void getListAppConfigure() async {
    _appRemoteConfig.fetchData().then((value) async {
      try {
        final listConfigure = await _appRemoteConfig.getMiniAppConfig();
        listAppConfig.value = listConfigure;
        listConfigure.forEach((element) =>print("#item ${element.toJson().toString()}"));

      } catch (e) {
        if (kDebugMode) {
          print(e);
        }
      }
    });
  }

}
