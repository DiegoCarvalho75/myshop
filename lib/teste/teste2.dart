import 'package:flutter/material.dart';
import './veryFloatingButton.dart';

class Teste2 extends StatefulWidget {
  const Teste2({Key key}) : super(key: key);

  @override
  _Teste2State createState() => _Teste2State();
}

class _Teste2State extends State<Teste2> {
  ///
  /// Definir aquia a função que será usada no botao
  void buttonFunction() {
    print('OK!');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        // mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Expanded(
            child: Stack(
              children: <Widget>[
                VeryFloatingButton(
                  // function: (() => buttonFunction()),
                  left: 0.0,
                  top: 100,
                  elevation: -10,
                ),
                VeryFloatingButton(
                  left: 120.0,
                  top: 100,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
