import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'inimigo/fantasma_azul.dart';
import 'inimigo/fantasma_laranja.dart';
import 'inimigo/fantasma_rosa.dart';
import 'inimigo/fantasma_vermelho.dart';
import 'pacman/pacman.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: Home());
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BonfireWidget(
      joystick: Joystick(directional: JoystickDirectional()),
      map: WorldMapByTiled('pac_man_mapa.tmj', objectsBuilder: {
        'fantasmaVermelho': ((properties) => FantasmaVermelho(
              position: properties.position,
              pacman: Pacman(properties.position),
              posicaoInicial: properties.position,
            )),
        'fantasmaLaranja': (properties) => FantasmaLaranja(
              position: properties.position,
              pacman: Pacman(properties.position),
              posicaoInicial: properties.position,
            ),
        'fantasmaAzul': (properties) => FantasmaAzul(
              position: properties.position,
              pacman: Pacman(properties.position),
              posicaoInicial: properties.position,
            ),
        'fantasmaRosa': (properties) => FantasmaRosa(
              position: properties.position,
              pacman: Pacman(properties.position),
              posicaoInicial: properties.position,
            ),
      }),
      player: Pacman(Vector2(31, 64)),
      cameraConfig: CameraConfig(moveOnlyMapArea: true, zoom: 1),
    );
  }
}
