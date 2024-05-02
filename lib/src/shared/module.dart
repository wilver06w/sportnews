import 'package:flutter_modular/flutter_modular.dart';
import 'package:sportnews/src/features/home/inject.dart';
import 'package:sportnews/src/features/home/module.dart';

class GlobalModule extends Module {
  @override
  void binds(Injector i) {
    InjectHomeUseCase.binds(i);
  }

  @override
  void routes(RouteManager r) {
    r.module('/', module: LoginModule());
  }
}
