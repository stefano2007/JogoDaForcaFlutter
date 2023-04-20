import 'package:provider/provider.dart';
import 'package:repos/controllers/JogoForcaController.dart';
import 'package:repos/repositories/CategoriaRepository.dart';
import 'package:repos/repositories/JogoForcaRepository.dart';
import 'package:repos/repositories/PalavraJogoForcaRepository.dart';
import 'repositories/JogadorRepository.dart';

final providers = [
  Provider<CategoriaRespository>(
    create: (context) => CategoriaRespository(),
  ),
  Provider<JogadorRepository>(
    create: (context) => JogadorRepository(),
  ),
  Provider<PalavraJogoForcaRepository>(
    create: (context) => PalavraJogoForcaRepository(),
  ),
  Provider<JogoForcaRepository>(
    create: (context) => JogoForcaRepository(
        jogadorRepository: context.read<JogadorRepository>(),
        palavrasRepository: context.read<PalavraJogoForcaRepository>()),
  ),
  Provider<JogoForcaController>(
    create: (context) => JogoForcaController(
      jogadorRepository: context.read<JogadorRepository>(),
      jogoRepository: context.read<JogoForcaRepository>(),
    ),
  ),
];
