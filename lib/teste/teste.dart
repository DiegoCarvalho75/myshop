import 'package:flutter/material.dart';
import '../utils/toHex.dart';
import 'package:gradient_text/gradient_text.dart';

class Teste extends StatefulWidget {
  const Teste({Key key}) : super(key: key);

  @override
  _TesteState createState() => _TesteState();
}

class _TesteState extends State<Teste> {
  var isPressed = false;

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;

    return Scaffold(
      body: GestureDetector(
        onPanStart: (_) {
          setState(() {
            isPressed = true;
          });
        },
        onPanEnd: (_) {
          setState(() {
            isPressed = false;
          });
        },
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
                blurRadius: 8,
                color: Colors.black,
                offset: isPressed ? Offset(15, 15) : Offset(20, 20),
              )
            ],
          ),
        ),
      ),
    );
  }
}
