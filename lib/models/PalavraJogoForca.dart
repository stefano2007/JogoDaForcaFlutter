import 'package:repos/models/CategoriaJogoForca.dart';

class PalavraJogoForca {
  int id;
  String valor;
  int idCategoria;
  CategoriaJogoForca? categoria;

  PalavraJogoForca({required this.id, required this.valor, required this.idCategoria});
}