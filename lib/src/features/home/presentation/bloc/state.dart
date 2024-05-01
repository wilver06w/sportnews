part of 'bloc.dart';

abstract class HomeState extends Equatable {
  final Model model;
  const HomeState(this.model);

  @override
  List<Object?> get props => [model];
}

class InitialState extends HomeState {
  const InitialState(super.model);
}

class LoadingListNewsSportState extends HomeState {
  const LoadingListNewsSportState(super.model);
}

class LoadingSearchState extends HomeState {
  const LoadingSearchState(super.model);
}

class SearchBreedState extends HomeState {
  const SearchBreedState(super.model);
}

class LoadedListNewsSportState extends HomeState {
  const LoadedListNewsSportState(super.model);
}

class ErrorListNewsSportState extends HomeState {
  const ErrorListNewsSportState({
    required Model model,
    this.message = '',
  }) : super(model);

  final String message;
}

class Model extends Equatable {
  const Model({
    this.listNewsSport = const [],
    this.breedSearch = '',
  });

  final List<NewsModels> listNewsSport;
  final String breedSearch;

  Model copyWith({
    List<NewsModels>? listNewsSport,
    String? breedSearch,
  }) {
    return Model(
      listNewsSport: listNewsSport ?? this.listNewsSport,
      breedSearch: breedSearch ?? this.breedSearch,
    );
  }

  @override
  List<Object?> get props {
    return [listNewsSport];
  }
}
