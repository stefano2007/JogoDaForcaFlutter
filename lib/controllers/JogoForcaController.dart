import 'package:flutter/material.dart';
import 'package:repos/models/JogoForca.dart';
import 'package:repos/models/PalavraJogoForca.dart';
import 'package:repos/repositories/JogadorRepository.dart';
import '../models/Jogador.dart';
import '../repositories/JogoForcaRepository.dart';

class JogoForcaController extends ChangeNotifier{

    final JogadorRepository jogadorRepository;
    final JogoForcaRepository jogoRepository;
    Jogador? jogador;
    JogoForca? jogo;
    String displayLetras="";
    String displayDica="";
    String _palavra="";
    final List<String> _palpites = [];

    int tentativas = 6;

    final int _tentativasPermitidas = 6;

    JogoForcaController({required this.jogadorRepository, required this.jogoRepository}) {
      this.obterJogador(1);

      /*_setPalavra("PRAIA GRANDE");
      addPalpite("P");
      //addPalpite("A");
      addPalpite("I");
      */

      IniciarJogo(1);
    }

    void IniciarJogo(int jogadorId) async {
      jogador = await jogadorRepository.ObterPorId(jogadorId);
      tentativas = 6;

      //Todo: criar um novo Jogo
      jogo = await jogoRepository.ObterPorId(1);

      if (jogo == null){
        return;
      }

      debugPrint("palavra ${jogo?.palavra}");

      _setPalavra(jogo?.palavra as PalavraJogoForca );
      removerPalpites();
      atualizarDisplay();
    }

    int getChances() =>
       (_tentativasPermitidas - _palpites.length);

    void obterJogador(int id) async {
      this.jogador = await this.jogadorRepository.ObterPorId(id);
    }

    _setPalavra(PalavraJogoForca palavra){
      _palavra = palavra.valor;
      displayDica = palavra.categoria?.nome ?? "";
    }

    removerPalpites(){
      _palpites.clear();
    }

    addPalpite(String letra){
      print("addPalpite $letra");
      _palpites.add(letra);
      atualizarDisplay();
    }

    atualizarDisplay(){
      displayLetras = _montarLetras(_palavra, _palpites);
      notifyListeners();
    }

    String _montarLetras(String palavra, List<String> palpites){
      var letras = palavra.split("");

      List<String> result = [];
      for(var l in letras){
        result.add(
              _obterCampo(l,
                    palpites.contains(l)
              )
        );
      }
      return result.join(" ");
    }

    String _obterCampo(String letra, bool mostrar){
      return (mostrar || letra == " " ? letra: "_");
    }

    void mostraMensagem(String mensagem, BuildContext context){
      debugPrint("mostraMensagem $mensagem");
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(mensagem),
        ),
      );
    }
}