import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../../core/data_state.dart';
import '../../domain/entities/home_card/home_card.dart';
import '../../domain/entities/home_section.dart';
import '../../domain/repositories/i_moviste_repository.dart';
import '../../domain/services/remote_source.dart/i_movies_remote_source.dart';

class MoviesRepository implements IMoviesRepository {
  final IMoviesRemoteSource _moviesRemoteSource;

  MoviesRepository({
    required IMoviesRemoteSource moviesRemoteSource,
  }) : _moviesRemoteSource = moviesRemoteSource;

  @override
  Future<DataState<HomeSection>> getMoviesSection({
    required String category,
  }) async {
    const library = 'movies_repository.getMovies';
    try {
      final Response response = await _moviesRemoteSource.getMovies(
        category: category,
      );

      return _handleResponse(
        response: response,
        library: library,
        category: category,
      );
    } on DioError catch (error, stack) {
      return _handleError(
        category: category,
        exception: error,
        library: library,
        stack: stack,
      );
    }
  }

  Future<DataState<HomeSection>> _handleResponse({
    required Response response,
    required String library,
    required String category,
  }) async {
    final body = response.data;
    final List movieList = body['results'];
    final List<HomeCard> movies = <HomeCard>[];
    for (var element in movieList) {
      try {
        final HomeCard movie = HomeCard.fromJson(
          element,
        );
        movies.add(movie);
      } catch (error, stack) {
        FlutterError.onError?.call(
          FlutterErrorDetails(
            exception: error,
            library: library,
            stack: stack,
          ),
        );
      }
    }

    return movies.isNotEmpty
        ? DataState<HomeSection>(
            state: CurrentState.success,
            data: HomeSection(
              category: category,
              movies: movies,
            ),
          )
        : DataState<HomeSection>(
            state: CurrentState.empty,
            data: HomeSection(
              category: category,
              movies: movies,
            ),
          );
  }

  DataState<HomeSection> _handleError({
    required DioError exception,
    required String library,
    required String category,
    StackTrace? stack,
  }) {
    FlutterError.onError?.call(
      FlutterErrorDetails(
        exception: exception,
        library: library,
        stack: stack,
      ),
    );

    return DataState<HomeSection>(
      state: CurrentState.error,
      error: exception,
    );
  }
}
