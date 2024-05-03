part of 'bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class LoadListNewSportEvent extends HomeEvent {}

class DeleteItemNewSportEvent extends HomeEvent {
  const DeleteItemNewSportEvent({
    required this.newsModels,
  });

  final NewsModels newsModels;
}
