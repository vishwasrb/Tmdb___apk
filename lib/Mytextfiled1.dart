import 'package:flutter/material.dart';

class Mytextfield1 extends StatelessWidget {
  final controller;
  final String hintText;
  final obscuretext;

  const Mytextfield1({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscuretext,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: TextField(
        controller: controller,
        obscureText: obscuretext,
        decoration: InputDecoration(
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
            ),
            fillColor: const Color.fromARGB(153, 255, 253, 253),
            filled: true,
            hintText: hintText,
            hintStyle: const TextStyle(
                color: Color.fromARGB(255, 0, 0, 0),
                fontSize: 19,
                fontWeight: FontWeight.w400)),
      ),
    );
  }
}
