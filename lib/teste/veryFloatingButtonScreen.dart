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
      body: Column(
        // mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Expanded(
            child: Stack(
              children: <Widget>[
                VeryFloatingButton(
                  left: 0.0,
                  top: 100,
                  shadowColor: HexColor('#0816dd'),
                ),
                VeryFloatingButton(
                  function: buttonFunction2,
                  text: 'Ok!!!',
                  left: 120.0,
                  top: 100,
                  shadowColor: HexColor('#070b45'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
