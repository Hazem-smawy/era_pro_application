abstract class UseCase<Type, Params> {}

class Params<T> {
  final T data;
  const Params(this.data);
}

class NoParams<T> {
  final void data;
  const NoParams(this.data);
}
