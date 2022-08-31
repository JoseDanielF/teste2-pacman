import 'package:bonfire/bonfire.dart';
import 'package:pacman/pacman/pacman.dart';

class Inimigo extends SimpleEnemy with ObjectCollision, AutomaticRandomMovement, Sensor {
  SimpleDirectionAnimation simpleDirectionAnimation;
  Pacman pacMan;
  double radiusCollision = 6;
  Vector2 posicaoInicial;

  Inimigo({required Vector2 position, required this.simpleDirectionAnimation, required this.pacMan, required this.posicaoInicial})
      : super(
          position: position,
          size: Vector2(32, 32),
          animation: simpleDirectionAnimation,
          speed: 80,
        ) {
    setupCollision(CollisionConfig(collisions: [CollisionArea.rectangle(size: Vector2(30, 30), align: Vector2(1, 1))]));
  }

  
  @override
  bool onCollision(GameComponent component, bool active) {
    if (component is SimpleEnemy){
      return false;
    }
    return super.onCollision(component, active);
  }
  
  @override
  void onContact(GameComponent component) {
    // TODO: implement onContact
  }
  
  @override
  void onContactExit(GameComponent component) {
    // TODO: implement onContactExit
  }
  
}
