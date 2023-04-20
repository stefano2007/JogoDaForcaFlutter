import 'package:flutter/cupertino.dart';

import '../models/PalavraJogoForca.dart';
import 'BaseRepository.dart';

class PalavraJogoForcaRepository implements BaseRepository<PalavraJogoForca> {
  List<PalavraJogoForca> _palavras = [];

  PalavraJogoForcaRepository() {
    debugPrint("init PalavraJogoForcaRespository");
    init();
  }

  @override
  Future<List<PalavraJogoForca>> Todos() async {
    return await Future(() => _palavras);
  }

  @override
  Future<PalavraJogoForca> ObterPorId(int id) async {
    return await Future(() => _palavras.firstWhere((x) => x.id == id));
  }

  @override
  Future Adicionar(PalavraJogoForca obj) async {
    await Future(() => _palavras.add(obj));
  }

  @override
  Future Remove(PalavraJogoForca obj) async {
    await Future(() => _palavras.remove(obj));
  }

  init() {
    //temporario
    _palavras = [];
    var palavra1 = PalavraJogoForca(id: 1, valor: "CACHORRO", idCategoria: 1);
    _palavras.add(palavra1);
    var palavra2 = PalavraJogoForca(id: 2, valor: "MACACO", idCategoria: 1);
    _palavras.add(palavra2);
    var palavra3 = PalavraJogoForca(id: 3, valor: "GIRAFA", idCategoria: 1);
    _palavras.add(palavra3);

    var palavra4 = PalavraJogoForca(id: 4, valor: "SANTOS", idCategoria: 2);
    _palavras.add(palavra4);
    var palavra5 =
        PalavraJogoForca(id: 5, valor: "PRAIA GRANDE", idCategoria: 2);
    _palavras.add(palavra5);

    var palavra6 =
        PalavraJogoForca(id: 6, valor: "BOB ESPONJA", idCategoria: 3);
    _palavras.add(palavra6);
    var palavra7 =
        PalavraJogoForca(id: 7, valor: "DRAGON BALL", idCategoria: 3);
    _palavras.add(palavra7);
  }
}
