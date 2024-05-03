import 'package:flutter_modular/flutter_modular.dart';
import 'package:sportnews/src/features/home/inject.dart';
import 'package:sportnews/src/shared/module.dart';

class AppModule extends Module {
  @override
  void binds(Injector i) {
    InjectHomeUseCase.binds(i);
    super.binds(i);
  }

  @override
  void routes(RouteManager r) {
    r.module('/', module: GlobalModule());
  }
}
