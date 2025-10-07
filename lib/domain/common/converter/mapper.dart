//ignore: one_member_abstracts
abstract class Mapper<T, E> {
  E map(T from);
}

abstract class MapperIterable<T, E> extends Mapper<T, E> {
  Iterable<E> mapList(Iterable<T> from) {
    return from.map(map);
  }
}
