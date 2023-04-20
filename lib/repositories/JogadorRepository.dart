import 'package:repos/models/Jogador.dart';
import 'BaseRepository.dart';

class JogadorRepository implements BaseRepository<Jogador> {
  List<Jogador> _jogadores = [];

  JogadorRepository() {
    init();
  }

  void init() {
    //temporario
    _jogadores = [];
    var jogador = Jogador(id: 1, nome: "Stefano");
    _jogadores.add(jogador);
  }

  @override
  Future<List<Jogador>> Todos() async {
    return await Future(() => _jogadores);
  }

  @override
  Future<Jogador> ObterPorId(int id) async {
    return await Future(() => _jogadores.firstWhere((x) => x.id == id));
  }

  @override
  Future Adicionar(Jogador obj) async {
    await Future(() => _jogadores.add(obj));
  }

  @override
  Future Remove(Jogador obj) async {
    await Future(() => _jogadores.remove(obj));
  }
}
