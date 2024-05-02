import 'package:flutter_modular/flutter_modular.dart';
import 'package:sportnews/src/shared/module.dart';

class AppModule extends Module {
  @override
  void routes(RouteManager r) {
    r.module('/', module: GlobalModule());
  }
}
