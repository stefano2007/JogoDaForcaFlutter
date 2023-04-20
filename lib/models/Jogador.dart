import 'JogoForca.dart';
class Jogador {
  int id;
  String nome;
  String? email;
  DateTime? dataNascimento;
  int? idade;
  Sexo? sexo;
  List<JogoForca> jogadas = [];

  int Vitorias(){
    List<JogoForca> result =
        jogadas.where((element) => element.venceu).toList();

    return result.length;
  }

  SetJogadas(List<JogoForca> jogadas){
    this.jogadas = jogadas;
  }

  Jogador({required this.id, required this.nome, this.email, this.dataNascimento, this.idade, this.sexo});
}
enum Sexo {
  Maculino,
  Fenimino,
  NaoInformado
}