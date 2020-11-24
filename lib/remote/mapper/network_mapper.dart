abstract class NetworkMapper<M, E> {
  E mapFromRemote(M type);
  M mapToRemote(E type);
}
