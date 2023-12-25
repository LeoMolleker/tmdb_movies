import '../../core/data_state.dart';
import '../../core/utils/constants.dart';
import '../entities/home_section.dart';
import '../repositories/i_moviste_repository.dart';
import 'i_use_case.dart';

typedef HomeSectionResponse = List<DataState<HomeSection>>;

class GetAllMoviesSectionUseCase extends UseCase<HomeSectionResponse, dynamic> {
  GetAllMoviesSectionUseCase({
    required IMoviesRepository moviesRepository,
  }) : _moviesRepository = moviesRepository;

  final IMoviesRepository _moviesRepository;

  @override
  Future<HomeSectionResponse> call({
    dynamic params,
  }) async {
    final HomeSectionResponse result = [];

    final nowPlayingMovies = await _moviesRepository.getMoviesSection(
      category: Constants.nowPlayingLabel,
    );
    final popularMovies = await _moviesRepository.getMoviesSection(
      category: Constants.popularLabel,
    );
    final topRatedMovies = await _moviesRepository.getMoviesSection(
      category: Constants.topRatedLabel,
    );
    final upcomingMovies = await _moviesRepository.getMoviesSection(
      category: Constants.upcomingLabel,
    );

    result.addAll(
      [
        nowPlayingMovies,
        popularMovies,
        topRatedMovies,
        upcomingMovies,
      ],
    );

    return result;
  }
}
