import 'package:cobras_e_escadas/cobras_escadas.dart';
import 'package:cobras_e_escadas/componentes/board.dart';
import 'package:cobras_e_escadas/componentes/painelDados.dart';
import 'package:cobras_e_escadas/componentes/painelInferior.dart';
import 'package:cobras_e_escadas/componentes/painelSuperior.dart';
import 'package:cobras_e_escadas/pages/game.dart';
import 'package:cobras_e_escadas/pages/inicio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cobras e Escadas',
      theme: ThemeData.dark(),
      home: InicioPage(),
      navigatorKey: CobraEscadas.navigatorKey,
      debugShowCheckedModeBanner: false,
    );
  }
}
