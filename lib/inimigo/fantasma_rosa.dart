import 'package:bonfire/bonfire.dart';
import 'package:bonfire/util/direction_animations/simple_direction_animation.dart';
import 'package:pacman/inimigo/fantasma_rosa_sprite.dart';
import 'package:pacman/inimigo/inimigo.dart';
import 'package:pacman/pacman/pacman.dart';

class FantasmaRosa extends Inimigo {
  FantasmaRosa(
      {required super.position,
      required Pacman pacman,
      required posicaoInicial})
      : super(
            pacMan: pacman,
            simpleDirectionAnimation: simpleDirectionAnimationGetter,
            posicaoInicial: posicaoInicial);

  static SimpleDirectionAnimation get simpleDirectionAnimationGetter =>
      SimpleDirectionAnimation(
        idleRight: FantasmaRosaSprite.idleRight,
        runRight: FantasmaRosaSprite.runRight,
        idleLeft: FantasmaRosaSprite.idleLeft,
        runLeft: FantasmaRosaSprite.runLeft,
      );
}
