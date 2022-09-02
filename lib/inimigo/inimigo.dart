import 'package:bonfire/bonfire.dart';
import 'package:pacman/inimigo/fantasma_dead.dart';
import 'package:pacman/pacman/pacman.dart';

class Inimigo extends SimpleEnemy
    with ObjectCollision, AutomaticRandomMovement {
  SimpleDirectionAnimation simpleDirectionAnimation;
  Pacman pacman;
  double radiusCollision = 7;
  Vector2 posicaoInicial;

  Inimigo(
      {required Vector2 position,
      required this.simpleDirectionAnimation,
      required this.pacman,
      required this.posicaoInicial})
      : super(
          position: position,
          size: Vector2(32, 32),
          animation: simpleDirectionAnimation,
          speed: 70,
        ) {
    setupCollision(CollisionConfig(collisions: [
      CollisionArea.rectangle(size: Vector2(30, 30), align: Vector2(1, 1))
    ]));
  }

  @override
  void update(double dt) {
    super.update(dt);
    if (!contato) {
      if (pacman.poder) {
        replaceAnimation(SimpleDirectionAnimation(
            idleRight: FantasmaDeadSprite.medo,
            runRight: FantasmaDeadSprite.medo));

        speed = 60;
        Future.delayed(const Duration(seconds: 9), () {
          replaceAnimation(simpleDirectionAnimation);
          speed = 80;
        });
        seeAndMoveToAttackRange(
            minDistanceFromPlayer: 250,
            positioned: (p) {},
            radiusVision: 64,
            notObserved: () {
              runRandomMovement(dt,
                  maxDistance: 190,
                  minDistance: 95,
                  speed: speed,
                  timeKeepStopped: 20);
            });
      } else {
        seeAndMoveToPlayer(
            margin: 0,
            radiusVision: 32,
            closePlayer: (player) {},
            notObserved: () {
              runRandomMovement(dt,
                  maxDistance: 190,
                  minDistance: 95,
                  speed: speed,
                  timeKeepStopped: 20);
            });
      }
    }
  }

  @override
  bool onCollision(GameComponent component, bool active) {
    if (component is SimpleEnemy) {
      return false;
    }
    return super.onCollision(component, active);
  }

  bool contato = false;

  @override
  void onContact(GameComponent component) {
    if (component is Player) {
      contato = true;
      if (pacman.poder) {
        gameRef.add(GameDecoration.withAnimation(
            animation: FantasmaDeadSprite.explosion,
            position: position,
            size: size));
        Future.delayed(const Duration(milliseconds: 1400), () {
          position = posicaoInicial;
          contato = false;
        });
      } else {
        component.die();
      }
    }
  }
}
