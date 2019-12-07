import 'package:flutter/material.dart';

class VeryFloatingButton extends StatefulWidget {
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
  final dynamic function;
  final Color shadowColor;

  const VeryFloatingButton({
    Key key,
    this.left = 0.0,
    this.top = 0.0,
    this.width = 100.0,
    this.height = 100.0,
    this.elevation = 8,
    this.text = 'Botão',
    this.textSize = 18,
    this.textColor = Colors.white,
    this.textColorPressed = Colors.orange,
    this.color = Colors.teal,
    this.function = null,
    this.shadowColor = Colors.purple,
  }) : super(key: key);

  @override
  _VeryFloatingButtonState createState() => _VeryFloatingButtonState();
}

class _VeryFloatingButtonState extends State<VeryFloatingButton> {
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
        onPanStart: (value) {
          pan(true);
          if (widget.function != null) {
            widget.function(value);
          } else
            print('nulo');
        },
        onPanEnd: (value) => pan(false),
        child: Container(
          margin: EdgeInsets.all(12.0),
          decoration: BoxDecoration(
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
