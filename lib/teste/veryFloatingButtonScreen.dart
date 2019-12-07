import 'package:flutter/material.dart';
import './veryFloatingButton.dart';
import '../utils/toHex.dart';

class VeryFloatingButtonScreen extends StatefulWidget {
  const VeryFloatingButtonScreen({Key key}) : super(key: key);

  @override
  _VeryFloatingButtonScreenState createState() =>
      _VeryFloatingButtonScreenState();
}

class _VeryFloatingButtonScreenState extends State<VeryFloatingButtonScreen> {
  ///
  /// [Define here the function(s) to be used in button(s)]
  ///
  void buttonFunction(String msg) {
    print(msg);
  }

  void buttonFunction2(DragStartDetails msg) {
    print(msg.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width - 10,
        height: MediaQuery.of(context).size.height - 10,
        color: Colors.red,
        child: ListView(
          children: <Widget>[
            Container(
              width: 200,
              height: 400,
              child: Stack(
                children: <Widget>[
                  VeryFloatingButton(
                    function: buttonFunction2,
                    left: 0.0,
                    top: 100,
                    width: 220,
                    height: 300,
                    shadowColor: HexColor('#070b45'),
                  ),
                ],
              ),
            ),
            Container(
              width: 200,
              height: 400,
              child: Stack(
                children: <Widget>[
                  VeryFloatingButton(
                    function: buttonFunction2,
                    left: 0.0,
                    top: 100,
                    width: 220,
                    height: 300,
                    shadowColor: HexColor('#070b45'),
                  ),
                ],
              ),
            ),
            Container(
              width: 200,
              height: 400,
              child: Stack(
                children: <Widget>[
                  VeryFloatingButton(
                    function: buttonFunction2,
                    left: 0.0,
                    top: 100,
                    width: 220,
                    height: 300,
                    shadowColor: HexColor('#070b45'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
