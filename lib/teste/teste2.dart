import 'dart:math';

import 'package:flutter/material.dart';
import '../utils/toHex.dart';
import 'package:gradient_text/gradient_text.dart';

class Teste2 extends StatefulWidget {
  const Teste2({Key key}) : super(key: key);

  @override
  _Teste2State createState() => _Teste2State();
}

class _Teste2State extends State<Teste2> {
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;

    return Scaffold(
      body: Column(
        // mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Expanded(
            child: Stack(
              children: <Widget>[
                Pos(left: 0),
                Pos(left: 200),
              ],
            ),
          ),
          Expanded(
            child: Container(
              child: Center(
                child: MaterialButton(
                  // minWidth: double.infinity,
                  hoverColor: Colors.amber,
                  color: Colors.teal,
                  onPressed: () => {},
                  child: Text('Botão'),
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Pos extends StatefulWidget {
  double left;

  Pos({Key key, this.left}) : super(key: key);

  @override
  _PosState createState() => _PosState();
}

class _PosState extends State<Pos> {
  bool isPressed = false;

  void pan(bool onOFf) {
    setState(() {
      isPressed = onOFf;
    });
  }

  void valor(value) {
    print(value);
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      child: GestureDetector(
        onPanStart: (value) {
          pan(true);
          valor(value);
        },
        onPanEnd: (_) => pan(false),
        child: Container(
          margin: EdgeInsets.all(12.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(3),
              topRight: Radius.circular(6),
              topLeft: Radius.circular(18),
              bottomRight: Radius.circular(24),
            ),
            color: Colors.red,
            boxShadow: [
              BoxShadow(
                blurRadius: isPressed ? 2 : 5,
                color: Colors.black87,
                offset: isPressed ? Offset(3, 3) : Offset(8, 8),
              )
            ],
          ),
          child: Center(
            child: Text('Botão'),
          ),
        ),
      ),
      width: 200,
      height: 100,
      top: isPressed ? 108 : 100,
      left: isPressed ? widget.left + 8 : widget.left,
    );
  }
}
