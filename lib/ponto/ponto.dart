import 'package:bonfire/bonfire.dart';
import 'package:pacman/pacman/pacman.dart';
import 'package:pacman/ponto/incrementar_ponto.dart';

class Ponto extends GameDecoration with Sensor {
  final IncrementarPontos incrementarPontos;
  final Pacman pacman;

  Ponto(
      {required Vector2 position,
      required this.incrementarPontos,
      required this.pacman})
      : super.withSprite(
            sprite: Sprite.load('ponto_no_chao.png'),
            position: position,
            size: Vector2(10, 10)) {
    setupSensorArea(
        intervalCheck: 320,
        areaSensor: [CollisionArea.rectangle(size: Vector2(5, 5))]);
  }

  @override
  void onContact(GameComponent component) {
    if (component is Player) {
      incrementarPontos.incrementar();
      removeFromParent();
    }
  }

  @override
  void onContactExit(GameComponent component) {}
}
