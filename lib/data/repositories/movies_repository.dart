import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../../core/data_state.dart';
import '../../domain/entities/movie_card.dart';
import '../../domain/repositories/i_moviste_repository.dart';
import '../../domain/services/remote_source.dart/i_movies_remote_source.dart';

class MoviesRepository implements IMoviesRepository {
  final IMoviesRemoteSource _moviesRemoteSource;

  MoviesRepository({
    required IMoviesRemoteSource moviesRemoteSource,
  }) : _moviesRemoteSource = moviesRemoteSource;

  @override
  Future<DataState<List<MovieCard>>> getTrendingMovies({
    required String timeWindow,
  }) async {
    try {
      final Response response = await _moviesRemoteSource.getTrendingMovies(
        timeWindow: timeWindow,
      );
      final body = response.data;
      final List movieList = body['results'];
      final List<MovieCard> movies = <MovieCard>[];
      for (var element in movieList) {
        try {
          final MovieCard movie = MovieCard.fromJson(
            element,
          );
          movies.add(movie);
        } catch (error, stack) {
          FlutterError.onError?.call(
            FlutterErrorDetails(
              exception: error,
              library: 'movies_repository.getTrendingMovies',
              stack: stack,
            ),
          );
        }
      }
      return movies.isNotEmpty
          ? DataState<List<MovieCard>>(
              state: CurrentState.success,
              data: movies,
            )
          : DataState(
              state: CurrentState.empty,
            );
    } on DioError catch (error, stack) {
      FlutterError.onError?.call(
        FlutterErrorDetails(
          exception: error,
          library: 'movies_repository.getTrendingMovies',
          stack: stack,
        ),
      );
      return DataState(
        state: CurrentState.error,
        error: error,
      );
    }
  }
}
