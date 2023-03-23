import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/data_state.dart';
import '../../core/utils/string_constants.dart';
import '../../data/repositories/movies_repository.dart';
import '../../domain/entities/movie_card.dart';

abstract class HomeMoviesEvent {}

class GetHomeMoviesEventDayTimeWindow extends HomeMoviesEvent {}

class GetHomeMoviesEventWeekTimeWindow extends HomeMoviesEvent {}

class HomeMoviesBloc extends Bloc<HomeMoviesEvent, DataState<Map<String, DataState<List<MovieCard>>>>> {
  final MoviesRepository _moviesRepository;

  static const dayTimeWindow = 'day';
  static const weekTimeWindow = 'week';

  HomeMoviesBloc({
    required MoviesRepository moviesRepository,
  })  : _moviesRepository = moviesRepository,
        super(
          DataState(
            state: CurrentState.loading,
          ),
        ) {
    on<GetHomeMoviesEventDayTimeWindow>((event, emit) async{
      await _handleGetHomeMoviesEvent(
        emitter: emit,
        timeWindow: dayTimeWindow,
      );
    });
    on<GetHomeMoviesEventWeekTimeWindow>((event, emit) async {
      await _handleGetHomeMoviesEvent(
        emitter: emit,
        timeWindow: weekTimeWindow,
      );
    });
  }

  Future<void> _handleGetHomeMoviesEvent({
    required Emitter<DataState<Map<String, DataState<List<MovieCard>>>>> emitter,
    required String timeWindow,
  }) async {
    final Map<String, DataState<List<MovieCard>>> moviesMap = {};
    emitter.call(
      DataState(
        state: CurrentState.loading,
      ),
    );
    moviesMap[StringConstants.trendingLabel] = await _moviesRepository.getTrendingMovies(
      timeWindow: timeWindow,
    );
    final state = _decideState(
        moviesMap: moviesMap,
      );
    emitter.call(
      state,
    );

    return;
  }

  DataState<Map<String, DataState<List<MovieCard>>>> _decideState({
    required Map<String, DataState<List<MovieCard>>> moviesMap,
  }) {
    final values = moviesMap.values;
    if (values.any((element) => element.hasData())) {
      return DataState(
        state: CurrentState.success,
        data: moviesMap,
      );
    }
    if (values.any((element) => element.isEmpty())) {
      return DataState(
        state: CurrentState.success,
        data: moviesMap,
      );
    }
    return DataState(
      state: CurrentState.error,
    );
  }
}
