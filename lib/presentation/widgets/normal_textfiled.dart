import 'package:flutter/material.dart';

class NormalTextField extends StatelessWidget {
  const NormalTextField({
    Key? key,
    required this.text, required this.iconData,
    required this.controller,
  }) : super(key: key);

  final TextEditingController controller;
  final String text;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelText: text,
        labelStyle: TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
        prefixIcon: Icon(
          iconData,
          color: Colors.white,
        ),
        filled: true,
        fillColor: Colors.grey,
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: Colors.white, width: 2)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: Colors.white, width: 2)),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: Colors.white, width: 2)),
      ),
    );
  }
}
