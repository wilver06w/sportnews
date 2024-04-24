import 'package:flutter_modular/flutter_modular.dart';
import 'package:sportnews/src/pages/home/page.dart';

class GlobalModule extends Module {
  @override
  void binds(Injector i) {}

  @override
  void routes(RouteManager r) {
    r.child(Modular.initialRoute, child: (context) => const Page());
  }
}
