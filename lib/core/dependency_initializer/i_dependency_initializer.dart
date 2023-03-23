import 'package:dio/dio.dart';

import '../../ui/blocs/home_bloc.dart';

abstract class IDependencyInitializer {
  Future<bool> initialize();

  Dio get dio;

  HomeMoviesBloc get homeMoviesBloc;
}
