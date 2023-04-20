import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controllers/JogoForcaController.dart';

class JogoForcaPage extends StatefulWidget {
  const JogoForcaPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<StatefulWidget> createState() => _JogoForcaPage();
}

class _JogoForcaPage extends State<JogoForcaPage> {
  Text MostrarLetras(String palavra) {
    return Text(
      palavra,
      style: const TextStyle(fontSize: 36),
    );
  }

  List<Widget> obterBotoes(JogoForcaController controller) {
    //const Alfabeto = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    const Alfabeto = "ABCDEF";

    List<Widget> result = [];

    for (String letra in Alfabeto.split("")) {
      result.add(
        TextButton(
          onPressed: () {
            debugPrint(letra);
            controller.addPalpite(letra);
            setState(() { /*forçar atualizar display */});
          },
          child: Text(
            letra,
            style: const TextStyle(fontSize: 16),
          ),
        ),
      );
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
            onPressed: () => {debugPrint('click button appBar')},
            icon: const Icon(Icons.refresh_outlined),
          ),
        ],
      ),
      body: Consumer<JogoForcaController>(
        builder: (context, jogoController, _) {
          final jogador = jogoController.jogador;

          debugPrint("Consumer<JogoForcaController>");

          if (jogador == null) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          //jogoController.setPalavra("PRAIA GRANDE");
          //jogoController.addPalpite("P");
          //jogoController.addPalpite("A");
          //jogoController.addPalpite("I");

          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                //Image.asset('a'),
                Text(
                  "Tentativas: ${jogoController.getChances()}",
                  style: const TextStyle(fontSize: 16),
                ),
                MostrarLetras(jogoController.displayLetras),
                Text(
                  jogador.nome,
                  style: const TextStyle(fontSize: 30),
                ),
                Row(
                  children: obterBotoes(jogoController),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
