import 'package:bonfire/bonfire.dart';
import 'package:bonfire/util/direction_animations/simple_direction_animation.dart';
import 'package:pacman/inimigo/fantasma_azul_sprite.dart';
import 'package:pacman/inimigo/inimigo.dart';
import 'package:pacman/pacman/pacman.dart';


class FantasmaAzul extends Inimigo {
  FantasmaAzul({required super.position, required Pacman pacman, required posicaoInicial})
      : super(pacMan: pacman, simpleDirectionAnimation: simpleDirectionAnimationGetter, posicaoInicial: posicaoInicial);

  static SimpleDirectionAnimation get simpleDirectionAnimationGetter => SimpleDirectionAnimation(
        idleRight: FantasmaAzulSprite.idleRight,
        runRight: FantasmaAzulSprite.runRight,
        idleLeft: FantasmaAzulSprite.idleLeft,
        runLeft: FantasmaAzulSprite.runLeft,
      );
}
