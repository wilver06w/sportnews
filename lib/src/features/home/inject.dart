import 'package:flutter_modular/flutter_modular.dart';
import 'package:sportnews/src/features/home/data/data_sources/remote/home_impl_api.dart';
import 'package:sportnews/src/features/home/data/repositories/home_repo_impl.dart';
import 'package:sportnews/src/features/home/domain/repositories/abstract_home_repository.dart';
import 'package:sportnews/src/features/home/domain/usecases/listnews_usecase.dart';

class InjectHomeUseCase {
  static void binds(Injector i) {
    i.addLazySingleton(HomeImplApi.new);
    i.addLazySingleton<AbstractHomeRepository>(HomeRepositoryImpl.new);
    i.addLazySingleton(ListNewsSportUseCase.new);
  }
}
