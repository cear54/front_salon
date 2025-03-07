import 'package:flutter/material.dart';

class MisBotones extends StatelessWidget {
  String text;
  Function() onPressed;
  Color color;
  Color textColor;
  double altura;

  MisBotones({
    super.key,
    required this.text,
    required this.onPressed(),
    this.color = Colors.white,
    this.altura = 30,
    this.textColor = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: altura,
      child: ElevatedButton(
        onPressed: () {
          onPressed();
        },
        style: ElevatedButton.styleFrom(backgroundColor: color),
        child: Text(
          text,
          style: TextStyle(color: textColor),
        ),
      ),
    );
  }
}
