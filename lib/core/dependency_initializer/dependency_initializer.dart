import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/services.dart';

import '../../data/repositories/movies_repository.dart';
import '../../data/services/remote_source/movies_remote_source.dart';
import '../../domain/use_cases/get_all_movies_section_use_case.dart';
import '../../ui/blocs/movies_bloc.dart';
import 'i_dependency_initializer.dart';

class DependencyInitializer implements IDependencyInitializer {
  DependencyInitializer();

  late Dio _dio;
  late MoviesRemoteSource _moviesRemoteSource;
  late MoviesRepository _moviesRepository;
  late GetAllMoviesSectionUseCase _getAllMoviesSectionUseCase;
  late HomeBloc _homeMoviesBloc;

  @override
  Dio get dio => _dio;

  @override
  HomeBloc get homeMoviesBloc => _homeMoviesBloc;

  @override
  Future<bool> initialize() async {
    final String file = await rootBundle.loadString('assets/json/config.json');
    final Map<String, dynamic> config = await json.decode(file);

    final BaseOptions baseOptions = BaseOptions(
      baseUrl: config['baseUrl']!,
      headers: <String, dynamic>{
        'Authorization': 'Bearer ${config['apiKey']}',
      },
    );

    _dio = Dio(
      baseOptions,
    );

    _moviesRemoteSource = MoviesRemoteSource(
      dio: _dio,
    );

    _moviesRepository = MoviesRepository(
      moviesRemoteSource: _moviesRemoteSource,
    );

    _getAllMoviesSectionUseCase = GetAllMoviesSectionUseCase(
      moviesRepository: _moviesRepository,
    );

    _homeMoviesBloc = HomeBloc(
      getAllMoviesUseCase: _getAllMoviesSectionUseCase,
    );
    return true;
  }
}
