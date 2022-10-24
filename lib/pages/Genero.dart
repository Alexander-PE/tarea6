// ignore: file_names
import 'package:flutter/material.dart';

class Genero extends StatefulWidget {
  const Genero({super.key});

  @override
  State<Genero> createState() => _GeneroState();
}

class _GeneroState extends State<Genero> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        TextField(
          decoration: InputDecoration(hintText: 'Inserte un nombre' ,border: OutlineInputBorder()),)
      ],
    );
  }
}