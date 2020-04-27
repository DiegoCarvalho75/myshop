import 'package:flutter/material.dart';
import './veryFloatingButtonScroll.dart';
import '../utils/toHex.dart';

class VeryFloatingButtonScreen extends StatefulWidget {
  const VeryFloatingButtonScreen({Key key}) : super(key: key);

  @override
  _VeryFloatingButtonScreenState createState() =>
      _VeryFloatingButtonScreenState();
}

class _VeryFloatingButtonScreenState extends State<VeryFloatingButtonScreen> {
  bool taped = false;

  ///
  /// [Define here the function(s) to be used in button(s)]
  ///
  void buttonFunction(String msg) {
    print(msg);
  }

  void buttonFunction2(DragStartDetails msg) {
    print(msg.toString());
  }

  void pan() {
    setState(() {
      taped = !taped;
      print(taped);
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    print(size.width);
    print(size.height);
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(16.0),
        width: size.width - 10,
        height: size.height - 10,
        // color: Colors.red,
        child: Center(
          child: ListView(
            children: <Widget>[
              IconButton(
                key: Key('icone'),
                icon: Icon(
                  Icons.ac_unit,
                  size: 48,
                ),
                onPressed: () => {},
              ),
              Container(
                width: 200,
                height: 300,
                child: Stack(
                  children: <Widget>[
                    VeryFloatingButtonScroll(
                      function: buttonFunction2,
                      left: 0.0,
                      width: 220,
                      height: 300,
                      shadowColor: HexColor('#070b45'),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: PhysicalModel(
                  clipBehavior: Clip.antiAlias,
                  // borderRadius: BorderRadius.circular(40),
                  elevation: taped ? 10 : 2,
                  shape: BoxShape.circle,
                  shadowColor: Colors.yellow,
                  color: Colors.white,
                  child: GestureDetector(
                    onTap: pan,
                    child: Container(
                      height: 120.0,
                      width: 120.0,
                      color: Colors.blue[50],
                      child: FlutterLogo(
                        size: 60,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                width: 200,
                height: 400,
                child: Stack(
                  children: <Widget>[
                    VeryFloatingButtonScroll(
                      function: buttonFunction2,
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
      ),
    );
  }
}
