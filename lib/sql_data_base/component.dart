import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TextInput extends StatelessWidget {
  String hintText, lableText;
  final Icon? preIcon, posIcon;
  TextInput(
      {super.key,
      required this.hintText,
      required this.lableText,
      required this.preIcon,
      required this.posIcon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: TextFormField(
        decoration: InputDecoration(
          fillColor: const Color.fromARGB(255, 222, 226, 231),
          filled: true,
          hintText: hintText,
          label: Text(lableText),
          hintStyle: const TextStyle(
            fontFamily: 'Pacifico',
            fontWeight: FontWeight.bold,
          ),
          suffixIcon: Icon(
            posIcon!.icon,
          ),
          prefixIcon: Icon(
            preIcon!.icon,
            color: const Color.fromARGB(255, 87, 6, 6),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.grey,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.grey,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
