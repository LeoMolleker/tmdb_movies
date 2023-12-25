import 'package:dio/dio.dart';

import '../../ui/blocs/movies_bloc.dart';

abstract class IDependencyInitializer {
  Future<bool> initialize();

  Dio get dio;

  HomeBloc get homeMoviesBloc;
}
