import 'package:bonfire/bonfire.dart';

import '../pacman/pacman.dart';

class Fruta extends GameDecoration with Sensor {
  final Pacman pacman;

  Fruta({required Vector2 position, required this.pacman}) : super.withSprite(sprite: Sprite.load('fruta_no_chao.png'), position: position, size: Vector2(32, 32)) {
    setupSensorArea(intervalCheck: 100);
  }

  @override
  void onContact(GameComponent component) {
    if (component is Pacman) {
      pacman.ativarPoder();
      removeFromParent();
    }
  }
  
  @override
  void onContactExit(GameComponent component) {
    // TODO: implement onContactExit
  }
}
