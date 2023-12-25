import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/data_state.dart';
import '../../domain/entities/home_section.dart';
import '../../domain/use_cases/get_all_movies_section_use_case.dart';
import 'movie_events.dart';

typedef HomeBlocState = DataState<HomeSectionResponse>;

class HomeBloc extends Bloc<HomeMoviesEvent, HomeBlocState> {
  final GetAllMoviesSectionUseCase _getAllMoviesUseCase;

  HomeBloc({
    required GetAllMoviesSectionUseCase getAllMoviesUseCase,
  })  : _getAllMoviesUseCase = getAllMoviesUseCase,
        super(
          DataState(
            state: CurrentState.loading,
          ),
        ) {
    on<GetAllMoviesCategories>(
      (event, emit) => _getAllMoviesSection(
        emit: emit,
      ),
    );
  }

  Future<void> _getAllMoviesSection({
    required Emitter<HomeBlocState> emit,
  }) async {
    emit(
      DataState(
        state: CurrentState.loading,
      ),
    );

    final response = await _getAllMoviesUseCase.call();

    emit(
      _getState(
        data: response,
      ),
    );
    return;
  }

  HomeBlocState _getState({
    required List<DataState<HomeSection>> data,
  }) {
    if (data.every((element) => element.hasError())) {
      return DataState(
        state: CurrentState.error,
      );
    }
    if (data.every((element) => element.isEmpty())) {
      return DataState(
        state: CurrentState.empty,
      );
    }
    return DataState(
      state: CurrentState.success,
      data: data,
    );
  }
}
