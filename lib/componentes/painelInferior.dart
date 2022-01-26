import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../cobras_escadas.dart';

class PainelInferior extends StatelessWidget {
  const PainelInferior(
      {Key? key, required this.orientation, required this.size})
      : super(key: key);

  final Orientation orientation;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Container(
        child: Flex(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            direction: orientation == Orientation.portrait
                ? Axis.horizontal
                : Axis.vertical,
            children: [
              Flexible(
                child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 0, vertical: 8),
                    child: Observer(builder: (_) {
                      return Container(
                        decoration: BoxDecoration(
                          color: CobraEscadas.dados.vez
                              ? Colors.white10
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text("Jogador 1"),
                              Observer(builder: (_) {
                                return Text(
                                    CobraEscadas.dados.posAvatar1.toString(),
                                    style: TextStyle(fontSize: 20),
                                    maxLines: 1);
                              }),
                            ],
                          ),
                        ),
                      );
                    })

                    ///////////////////
                    ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Observer(builder: (_) {
                  return MaterialButton(
                      clipBehavior: Clip.antiAlias,
                      color: Colors.green,
                      disabledColor: Colors.grey,
                      child: Container(
                        width: size * 0.3,
                        height: size * 0.1,
                        child: const Center(
                          child: Text("Jogar Dados"),
                        ),
                      ),
                      onPressed: CobraEscadas.dados.block
                          ? null
                          : CobraEscadas.jogarDado);
                }),
              ),
              Flexible(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 0, vertical: 8),
                  child: Observer(builder: (_) {
                    return Container(
                      decoration: BoxDecoration(
                        color: !CobraEscadas.dados.vez
                            ? Colors.white10
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text("Jogador 2"),
                            Observer(builder: (_) {
                              return Text(
                                CobraEscadas.dados.posAvatar2.toString(),
                                style: TextStyle(fontSize: 20),
                              );
                            })
                          ],
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ]),
      ),
    );
  }
}
