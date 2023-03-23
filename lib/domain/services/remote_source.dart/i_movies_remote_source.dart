import 'package:dio/dio.dart';

abstract class IMoviesRemoteSource {
  Future<Response> getTrendingMovies({
    required String timeWindow,
  });
}
