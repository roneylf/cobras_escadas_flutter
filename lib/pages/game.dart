import 'package:cobras_e_escadas/componentes/board.dart';
import 'package:cobras_e_escadas/componentes/painelDados.dart';
import 'package:cobras_e_escadas/componentes/painelInferior.dart';
import 'package:cobras_e_escadas/componentes/painelSuperior.dart';
import 'package:cobras_e_escadas/pages/inicio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:rive/rive.dart';

import '../cobras_escadas.dart';

class GamePage extends StatefulWidget {
  GamePage({Key? key}) : super(key: key);

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Cobras e Escadas"),
          actions: [
            IconButton(
                onPressed: () {
                  CobraEscadas.dados.posAvatar1 = 0;
                  CobraEscadas.dados.posAvatar2 = 0;
                  CobraEscadas.dados.vez = false;
                  CobraEscadas.dados.valueDado1 = 0;
                  CobraEscadas.dados.valueDado2 = 0;
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (_) {
                    return InicioPage();
                  }), (route) => false);
                },
                icon: Icon(Icons.exit_to_app))
          ],
        ),
        body: LayoutBuilder(builder: (context, constraints) {
          Orientation orientation = MediaQuery.of(context).orientation;
          double size = orientation == Orientation.portrait
              ? constraints.maxWidth
              : constraints.maxHeight;
          return Flex(
            direction: orientation == Orientation.portrait
                ? Axis.vertical
                : Axis.horizontal,
            children: [
              Expanded(
                child: Observer(builder: (_) {
                  if (CobraEscadas.dados.posAvatar1 != 0 &&
                      CobraEscadas.dados.posAvatar2 != 0) {
                    return RiveAnimation.asset("assets/animations/monster.riv");
                  }
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: PainelSuperior(orientation: orientation, size: size),
                  );
                }),
                flex: 2,
              ),
              Board(orientation: orientation, size: size),
              PainelInferior(orientation: orientation, size: size),
              PainelDados(orientation: orientation, size: size),
            ],
          );
        }));
  }
}
