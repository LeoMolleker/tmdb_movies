import 'package:dio/dio.dart';

abstract class IMoviesRemoteSource {
  Future<Response> getMovies({
    required String category,
  });
}
