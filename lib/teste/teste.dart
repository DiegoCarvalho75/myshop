import 'package:flutter/material.dart';
import '../utils/toHex.dart';
import 'package:gradient_text/gradient_text.dart';

class Teste extends StatefulWidget {
  const Teste({Key key}) : super(key: key);

  @override
  _TesteState createState() => _TesteState();
}

class _TesteState extends State<Teste> {
  bool isPressed = false;

  void pan(bool pressed) {
    setState(() {
      isPressed = pressed;
    });
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;

    return Scaffold(
      body: GestureDetector(
        onPanStart: (_) => pan(true),
        onPanEnd: (_) => pan(false),
        child: Container(
          margin: EdgeInsets.all(62.0),
          padding: EdgeInsets.all(12.0),
          width: deviceSize.width,
          height: deviceSize.height,
          child: Center(
            child: FittedBox(
              child: GradientText(
                'Teste',
                gradient: LinearGradient(
                  colors: [
                    HexColor('#a21515'),
                    HexColor('#1f15a2'),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: [0, 1],
                ),
                style: Theme.of(context).textTheme.display4,
              ),
            ),
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(18),
              topRight: Radius.circular(18),
            ),
            gradient: LinearGradient(
              colors: [
                HexColor('#1f15a2'),
                HexColor('#a21515'),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: [0, 1],
            ),
            boxShadow: [
              BoxShadow(
                blurRadius: isPressed ? 2 : 5,
                color: Colors.black87,
                offset: isPressed ? Offset(10, 10) : Offset(15, 15),
              )
            ],
          ),
        ),
      ),
    );
  }
}
