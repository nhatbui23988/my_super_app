import 'package:domain/entity/mini_app_configure.dart';

extension ListX on List {
  List<MiniAppConfigure> toListAppConfigure() {
    if (isEmpty) {
      return [];
    }
    final List<MiniAppConfigure> listAppConfigure = [];
    forEach((json) {
      if (json is Map<String, dynamic>) {
        listAppConfigure.add(MiniAppConfigure.fromJson(json));
      }
    });
    return listAppConfigure;
  }
}
