import 'Jogador.dart';
import 'PalavraJogoForca.dart';

class JogoForca {
  int id;
  DateTime Data;
  Jogador jogador;
  PalavraJogoForca palavra;
  DateTime? dataFim;
  bool venceu = false;

  JogoForca({required this.id, required this.Data, required this.jogador, required this.palavra});
}