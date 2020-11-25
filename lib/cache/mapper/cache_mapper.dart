abstract class CacheMapper<M, E> {
  E mapFromCache(M type);
  M mapToCache(E type);
}
