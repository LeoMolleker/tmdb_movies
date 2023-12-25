import '../../core/data_state.dart';
import '../entities/home_section.dart';

abstract class IMoviesRepository {
  Future<DataState<HomeSection>> getMoviesSection({
    required String category,
  });
}
