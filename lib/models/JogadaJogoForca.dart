import 'JogoForca.dart';

class JogadaJogoForca {
  int id;
  int idJogoForca;
  JogoForca? jogo;
  String palpite;
  bool? acertou = false;

  JogadaJogoForca({required this.id, required this.idJogoForca, required this.palpite, this.acertou});
}