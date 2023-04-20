import 'package:repos/models/CategoriaJogoForca.dart';
import 'BaseRepository.dart';

class CategoriaRespository implements BaseRepository<CategoriaJogoForca> {
  List<CategoriaJogoForca> _categorias = [];

  CategoriaRespository() {
    init();
  }

  void init() {
    //temporario
    _categorias = [];
    var categoria1 = CategoriaJogoForca(id: 1, nome: "Animal");
    _categorias.add(categoria1);

    var categoria2 = CategoriaJogoForca(id: 2, nome: "Cidade");
    _categorias.add(categoria2);

    var categoria3 = CategoriaJogoForca(id: 3, nome: "Desenho Animado");
    _categorias.add(categoria3);
  }

  @override
  Future<List<CategoriaJogoForca>> Todos() async {
    return await Future(() => _categorias);
  }

  @override
  Future<CategoriaJogoForca?> ObterPorId(int id) async {
    return await Future(() => _categorias.firstWhere((x) => x.id == id));
  }

  @override
  Future Adicionar(CategoriaJogoForca obj) async {
    await Future(() => _categorias.add(obj));
  }

  @override
  Future Remove(CategoriaJogoForca obj) async {
    await Future(() => _categorias.remove(obj));
  }
}
