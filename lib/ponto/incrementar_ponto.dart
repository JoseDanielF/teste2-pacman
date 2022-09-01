import 'package:flutter/widgets.dart';
import 'package:pacman/pacman/pacman.dart';

class IncrementarPontos extends ChangeNotifier {
  Pacman pacman;
  void incrementar() {
    pacman.pontuacao = pacman.pontuacao + 10;
    notifyListeners();
  }

  IncrementarPontos({
    required this.pacman,
  });
}
