import 'package:bonfire/bonfire.dart';
import 'package:bonfire/util/direction_animations/simple_direction_animation.dart';
import 'package:pacman/inimigo/inimigo.dart';
import 'package:pacman/inimigo/fantasma_vermelho_sprite.dart';
import 'package:pacman/pacman/pacman.dart';


class FantasmaVermelho extends Inimigo {
  FantasmaVermelho({required super.position, required Pacman pacman, required posicaoInicial})
      : super(pacman: pacman, simpleDirectionAnimation: simpleDirectionAnimationGetter, posicaoInicial: posicaoInicial);

  static SimpleDirectionAnimation get simpleDirectionAnimationGetter => SimpleDirectionAnimation(
        idleRight: FantasmaVermelhoSprite.idleRight,
        runRight: FantasmaVermelhoSprite.runRight,
        idleLeft: FantasmaVermelhoSprite.idleLeft,
        runLeft: FantasmaVermelhoSprite.runLeft,
      );
}
