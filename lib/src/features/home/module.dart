import 'package:flutter_modular/flutter_modular.dart';
import 'package:sportnews/src/features/home/presentation/page.dart';

class LoginModule extends Module {
  @override
  void routes(RouteManager r) {
    r.child(Modular.initialRoute, child: (context) => const Page());
  }
}
