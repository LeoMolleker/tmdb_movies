import 'package:dio/dio.dart';

import '../../../core/utils/constants.dart';
import '../../../domain/services/remote_source.dart/i_movies_remote_source.dart';

class MoviesRemoteSource implements IMoviesRemoteSource {
  final Dio _dio;

  final Map<String, String> movieEndpoints = {
    Constants.popularLabel: '/movie/popular',
    Constants.topRatedLabel: '/movie/top_rated',
    Constants.upcomingLabel: '/movie/upcoming',
    Constants.nowPlayingLabel: '/movie/now_playing',
  };

  static const String trendingMoviesEndpoint = '/trending/movie/{time_window}';
  static const String detailsEndpoint = '/movie/{movie_id}';
  static const String creditsEndpoint = '/movie/{movie_id}/credits';
  static const String externalIdsEndpoint = '/movie/{movie_id}/external_ids';
  static const String imagesEndpoint = '/movie/{movie_id}/images';
  static const String keywordsEndpoint = '/movie/{movie_id}/keywords';
  static const String recommendationsEndpoint = '/movie/{movie_id}/recommendations';
  static const String releasesDatesEndpoint = '/movie/{movie_id}/release_dates';
  static const String reviewsEndpoint = '/movie/{movie_id}/reviews';
  static const String similarMoviesEndpoint = '/movie/{movie_id}/similar';
  static const String videosEndpoint = '/movie/{movie_id}/videos';

  MoviesRemoteSource({
    required Dio dio,
  }) : _dio = dio;

  Future<Response> getTrendingMovies({
    required String timeWindow,
  }) {
    return _dio.get(
      trendingMoviesEndpoint.replaceFirst(
        '{time_window}',
        timeWindow,
      ),
    );
  }

  @override
  Future<Response> getMovies({
    required String category,
  }) {
    return _dio.get(
      movieEndpoints[category]!,
    );
  }
}
