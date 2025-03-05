import 'package:flutter/material.dart';

class MisTextfield extends StatelessWidget {
  String label;
  IconData icono;
  Function(String text) onChanged;
  bool obscureText;

  MisTextfield(
      {super.key,
      required this.label,
      required this.icono,
      required this.onChanged,
      this.obscureText = false});

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (text) {
        onChanged(text);
      },
      obscureText: obscureText,
      decoration: InputDecoration(
        label: Text(
          label,
          style: TextStyle(color: Colors.white),
        ),
        prefixIcon: Icon(
          icono,
          color: Colors.white,
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
