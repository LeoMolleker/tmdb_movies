abstract class Usecase<T, P> {
  Future<T> call({
    final P params,
  });
}
