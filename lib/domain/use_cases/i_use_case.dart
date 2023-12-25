abstract class UseCase<E, P> {
  Future<E> call({
    P? params,
  });
}
