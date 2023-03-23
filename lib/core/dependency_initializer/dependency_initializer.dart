import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/services.dart';

import '../../data/repositories/movies_repository.dart';
import '../../data/services/remote_source/movies_remote_source.dart';
import '../../ui/blocs/home_bloc.dart';
import 'i_dependency_initializer.dart';

class DependencyInitializer implements IDependencyInitializer {
  DependencyInitializer();

  late Dio _dio;
  late MoviesRemoteSource _moviesRemoteSource;
  late MoviesRepository _moviesRepository;
  late HomeMoviesBloc _homeMoviesBloc;

  @override
  Dio get dio => _dio;

  @override
  HomeMoviesBloc get homeMoviesBloc => _homeMoviesBloc;

  @override
  Future<bool> initialize() async {
    final String file = await rootBundle.loadString('assets/jsons/config.json');
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

    _homeMoviesBloc = HomeMoviesBloc(
      moviesRepository: _moviesRepository,
    );
    return true;
  }
}
