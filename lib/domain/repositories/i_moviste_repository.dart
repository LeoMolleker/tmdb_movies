import '../../core/data_state.dart';
import '../entities/movie_card.dart';

abstract class IMoviesRepository {
  Future<DataState<List<MovieCard>>> getTrendingMovies({
    required String timeWindow,
  });
}
