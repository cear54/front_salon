import 'package:flutter/material.dart';

class MisTextfield extends StatelessWidget {
  String label;
  String? errorTx;
  IconData icono;
  Function(String text) onChanged;
  bool obscureText;
  Color iconColor;

  MisTextfield(
      {super.key,
      required this.label,
      this.errorTx,
      required this.icono,
      required this.onChanged,
      this.obscureText = false,
      this.iconColor = Colors.white});

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (text) {
        onChanged(text);
      },
      obscureText: obscureText,
      decoration: InputDecoration(
        errorText: errorTx,
        label: Text(
          label,
          style: TextStyle(color: Colors.white),
        ),
        prefixIcon: Icon(
          icono,
          color: iconColor,
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
      ),
      style: TextStyle(color: Colors.white), //!Color del texto
    );
  }
}
