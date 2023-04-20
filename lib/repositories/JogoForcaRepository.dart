import 'package:repos/models/JogoForca.dart';
import 'package:repos/repositories/PalavraJogoForcaRepository.dart';
import 'BaseRepository.dart';
import 'JogadorRepository.dart';

class JogoForcaRepository implements BaseRepository<JogoForca> {
  List<JogoForca> _jogos = [];
  JogadorRepository jogadorRepository;
  PalavraJogoForcaRepository palavrasRepository;

  JogoForcaRepository(
      {required this.jogadorRepository, required this.palavrasRepository}) {
    init();
  }

  void init() async {
    var jogador = await jogadorRepository.ObterPorId(1);
    var palavra = await palavrasRepository.ObterPorId(2);

    //temporario
    _jogos = [];
    var jogo = JogoForca(
        id: 1, Data: DateTime.now(), jogador: jogador, palavra: palavra);
    _jogos.add(jogo);
  }

  @override
  Future<List<JogoForca>> Todos() async {
    return await Future(() => _jogos);
  }

  @override
  Future<JogoForca?> ObterPorId(int id) async {
    return await Future(() => _jogos.firstWhere((x) => x.id == id));
  }

  @override
  Future Adicionar(JogoForca obj) async {
    await Future(() => _jogos.add(obj));
  }

  @override
  Future Remove(JogoForca obj) async {
    await Future(() => _jogos.remove(obj));
  }
}
