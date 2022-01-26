import 'package:cobras_e_escadas/pages/game.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class InicioPage extends StatefulWidget {
  InicioPage({Key? key}) : super(key: key);

  @override
  State<InicioPage> createState() => _InicioPageState();
}

class _InicioPageState extends State<InicioPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Flex(
          direction: Axis.vertical,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                "Cobras e Escadas",
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.w100),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
                height: 200,
                child:
                    RiveAnimation.asset('assets/animations/cobraeescadas.riv')),
            SizedBox(height: 50),
            MaterialButton(
                color: Colors.cyan,
                onPressed: () {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (_) {
                    return GamePage();
                  }), (route) => false);
                },
                child: SizedBox(
                    height: 30,
                    width: 100,
                    child: Center(child: Text('Jogar')))),
          ],
        ),
      ),
    );
  }
}
