import 'package:flutter/material.dart';

class MisBtnback extends StatelessWidget {
  double top;
  double left;
  Color color;
  double size;

  MisBtnback({
    super.key,
    required this.top,
    required this.left,
    this.color = Colors.white,
    this.size = 30,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      margin: EdgeInsets.only(top: top, left: left),
      child: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: color,
            size: size,
          )),
    );
  }
}
