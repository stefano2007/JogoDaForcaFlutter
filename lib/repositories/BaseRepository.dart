abstract class BaseRepository<T> {
  Future<List<T>> Todos();
  Future<T?> ObterPorId(int id);
  Future Adicionar(T obj);
  Future Remove(T obj);
}