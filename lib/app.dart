import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:pacman/inimigo/fantasma_vermelho.dart';
import 'package:pacman/ponto/incrementar_ponto.dart';

import 'inimigo/fantasma_azul.dart';
import 'inimigo/fantasma_laranja.dart';
import 'inimigo/fantasma_rosa.dart';
import 'pacman/pacman.dart';
import 'ponto/ponto.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BonfireWidget(
      joystick: Joystick(directional: JoystickDirectional()),
      map: WorldMapByTiled('pac_man_mapa.tmj', objectsBuilder: {
        'fantasmaVermelho': ((properties) => FantasmaVermelho(
              position: properties.position,
              pacman: Pacman(properties.position, 0),
              posicaoInicial: properties.position,
            )),
        'fantasmaLaranja': (properties) => FantasmaLaranja(
              position: properties.position,
              pacman: Pacman(properties.position, 0),
              posicaoInicial: properties.position,
            ),
        'fantasmaAzul': (properties) => FantasmaAzul(
              position: properties.position,
              pacman: Pacman(properties.position, 0),
              posicaoInicial: properties.position,
            ),
        'fantasmaRosa': (properties) => FantasmaRosa(
              position: properties.position,
              pacman: Pacman(properties.position, 0),
              posicaoInicial: properties.position,
            ),
        'ponto': (properties) => Ponto(
              position: properties.position,
              incrementarPontos:
                  IncrementarPontos(pacman: Pacman(properties.position, 0)),
              pacman: Pacman(properties.position, 0),
            ),
      }),
      player: Pacman(Vector2(31, 64), 0),
      cameraConfig: CameraConfig(moveOnlyMapArea: true, zoom: 1),
    );
  }
}
