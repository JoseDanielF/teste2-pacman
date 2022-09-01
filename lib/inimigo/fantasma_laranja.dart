import 'package:bonfire/bonfire.dart';
import 'package:bonfire/util/direction_animations/simple_direction_animation.dart';
import 'package:pacman/inimigo/fantasma_laranja_sprite.dart';
import 'package:pacman/inimigo/inimigo.dart';
import 'package:pacman/pacman/pacman.dart';


class FantasmaLaranja extends Inimigo {
  FantasmaLaranja({required super.position, required Pacman pacman, required posicaoInicial})
      : super(pacman: pacman, simpleDirectionAnimation: simpleDirectionAnimationGetter, posicaoInicial: posicaoInicial);

  static SimpleDirectionAnimation get simpleDirectionAnimationGetter => SimpleDirectionAnimation(
        idleRight: FantasmaLaranjaSprite.idleRight,
        runRight: FantasmaLaranjaSprite.runRight,
        idleLeft: FantasmaLaranjaSprite.idleLeft,
        runLeft: FantasmaLaranjaSprite.runLeft,
      );
}
