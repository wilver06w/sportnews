import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sportnews/src/features/home/domain/entities/news_model.dart';
import 'package:sportnews/src/features/home/domain/usecases/deletenews_usecase.dart';
import 'package:sportnews/src/features/home/domain/usecases/listnews_usecase.dart';

part 'event.dart';
part 'state.dart';

class BlocHome extends Bloc<HomeEvent, HomeState> {
  BlocHome({
    required this.deleteNewsSportUseCase,
    required this.listBreedUseCase,
  }) : super(const InitialState(Model())) {
    on<LoadListNewSportEvent>(_onLoadListNewSportEvent);
    on<DeleteItemNewSportEvent>(_onDeleteItemNewSportEvent);
  }
  final ListNewsSportUseCase listBreedUseCase;
  final DeleteNewsSportUseCase deleteNewsSportUseCase;

  Future<void> _onDeleteItemNewSportEvent(
    DeleteItemNewSportEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(LoadingDeleteNewsSportState(state.model));

    final newSportDeleted = await deleteNewsSportUseCase.call(event.newsModels);

    newSportDeleted.fold((l) {
      emit(
        ErrorDeleteItemNewsSportState(
          model: state.model,
          message: l.errorMessage,
        ),
      );
    }, (r) {
      emit(
        LoadedDeleteNewsSportState(state.model),
      );
    });
  }

  Future<void> _onLoadListNewSportEvent(
    LoadListNewSportEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(LoadingListNewsSportState(state.model));

    final listBreeds = await listBreedUseCase.call();

    listBreeds.fold((l) {
      emit(
        ErrorListNewsSportState(
          model: state.model,
          message: l.errorMessage,
        ),
      );
    }, (r) {
      emit(
        LoadedListNewsSportState(
          state.model.copyWith(
            listNewsSport: r,
          ),
        ),
      );
    });
  }
}
