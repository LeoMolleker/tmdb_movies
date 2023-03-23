import 'package:dio/dio.dart';

class DataState<T> {
  final CurrentState state;
  final T? data;
  final DioError? error;

  DataState({
    required this.state,
    this.data,
    this.error,
  });

  bool isLoading() => state == CurrentState.loading;

  bool isEmpty() => state == CurrentState.empty;

  bool hasError() => state == CurrentState.error;

  bool hasData() => state == CurrentState.success;
}

enum CurrentState {
  loading,
  error,
  success,
  empty,
}
