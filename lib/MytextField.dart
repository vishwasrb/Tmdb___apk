import 'package:flutter/material.dart';

class Mytextfield extends StatelessWidget {
  final controller;
  final String hintText;
  final obscuretext;

  const Mytextfield({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscuretext,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: TextField(
        controller: controller,
        obscureText: obscuretext,
        decoration: InputDecoration(
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Color.fromARGB(255, 188, 182, 182)),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Color.fromARGB(153, 238, 233, 233)),
            ),
            fillColor: const Color.fromARGB(153, 219, 215, 215),
            filled: true,
            hintText: hintText,
            hintStyle: const TextStyle(color: Colors.white, fontSize: 20)),
      ),
    );
  }
}
