import 'package:flutter/material.dart';

class VeryFloatingButtonScroll extends StatefulWidget {
  final double left;
  final double top;
  final double width;
  final double height;
  final double elevation;
  final String text;
  final double textSize;
  final Color textColor;
  final Color textColorPressed;
  final Color color;
  final Function function;
  final Color shadowColor;

  const VeryFloatingButtonScroll({
    Key key,
    this.left = 0.0,
    this.top = 0.0,
    this.width = 100.0,
    this.height = 100.0,
    this.elevation = 8,
    this.text = '',
    this.textSize = 18,
    this.textColor = Colors.white,
    this.textColorPressed = Colors.orange,
    this.color = Colors.teal,
    this.function,
    this.shadowColor = Colors.black87,
  }) : super(key: key);

  @override
  _VeryFloatingButtonScrollState createState() =>
      _VeryFloatingButtonScrollState();
}

class _VeryFloatingButtonScrollState extends State<VeryFloatingButtonScroll> {
  bool isPressed = false;

  void pan(bool onOFf) {
    setState(() {
      isPressed = onOFf;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      child: GestureDetector(
        onVerticalDragStart: (value) 
         {
           print(value);
           pan(true);
           
           },
        child: Container(
          margin: EdgeInsets.all(12.0),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                  'https://cdn.pixabay.com/photo/2019/12/01/00/39/haflinger-4664537_960_720.jpg'),
              fit: BoxFit.none,
            ),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(3),
              topRight: Radius.circular(6),
              topLeft: Radius.circular(18),
              bottomRight: Radius.circular(24),
            ),
            color: widget.color,
            boxShadow: [
              BoxShadow(
                blurRadius: isPressed ? 1 : 5,
                color: widget.shadowColor,
                offset: isPressed
                    ? Offset(2, 2)
                    : Offset(widget.elevation, widget.elevation),
              )
            ],
          ),
          child: Center(
            child: Text(
              widget.text,
              style: TextStyle(
                color: !isPressed ? widget.textColor : widget.textColorPressed,
                fontSize: widget.textSize,
              ),
            ),
          ),
        ),
      ),
      width: widget.width,
      height: widget.height,
      top: isPressed ? widget.top + widget.elevation : widget.top,
      left: isPressed ? widget.left + widget.elevation : widget.left,
    );
  }
}
