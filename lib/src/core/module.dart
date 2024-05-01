import 'package:flutter_modular/flutter_modular.dart';
import 'package:sportnews/src/features/home/data/data_sources/remote/home_impl_api.dart';
import 'package:sportnews/src/features/home/data/repositories/home_repo_impl.dart';
import 'package:sportnews/src/features/home/domain/repositories/abstract_home_repository.dart';
import 'package:sportnews/src/features/home/domain/usecases/listnews_usecase.dart';
import 'package:sportnews/src/shared/module.dart';

class AppModule extends Module {
  @override
  void binds(Injector i) {
    i.addLazySingleton(
      (i) => HomeImplApi(),
    );
    i.addLazySingleton(
      (i) => HomeRepositoryImpl(
        articlesApi: i<HomeImplApi>(),
      ),
    );
    i.addLazySingleton(() => AbstractHomeRepository);
    i.addLazySingleton(
        (i) => ListNewsSportUseCase(repository: i<AbstractHomeRepository>()));
  }

  @override
  void routes(RouteManager r) {
    r.module('/', module: GlobalModule());
  }
}
