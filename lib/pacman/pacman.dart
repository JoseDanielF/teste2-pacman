import 'package:bonfire/bonfire.dart';

import 'pacman_sprite.dart';

class Pacman extends SimplePlayer with ObjectCollision {
  Pacman(Vector2? position, this.pontuacao)
      : super(
          size: Vector2(32, 32),
          animation: SimpleDirectionAnimation(
            idleRight: PacmanSprite.idleRight,
            runRight: PacmanSprite.runRight,
            idleLeft: PacmanSprite.idleLeft,
            runLeft: PacmanSprite.runLeft,
            idleUp: PacmanSprite.idleUp,
            runUp: PacmanSprite.runUp,
            idleDown: PacmanSprite.idleDown,
            runDown: PacmanSprite.runDown,
          ),
          position: position ?? Vector2(10, 10),
          speed: 50,
        ) {
    setupCollision(CollisionConfig(
        collisions: [CollisionArea.rectangle(size: Vector2(30, 30))]));
  }

  bool poder = false;
  int pontuacao;
  
  void ativarPoder() {
    poder = true;
    Future.delayed(const Duration(seconds: 8), () {
      poder = false;
    });
  }
}
