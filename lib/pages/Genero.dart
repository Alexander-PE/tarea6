// ignore: file_names
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http; 

class Genero extends StatefulWidget {
  const Genero({super.key});

  @override
  State<Genero> createState() => _GeneroState();
}

class _GeneroState extends State<Genero> {

  final _textController = TextEditingController();

  List persona = [];

  String name = "";
  static const man = TextStyle(color: Colors.blue);
  static const woman = TextStyle(color: Colors.pink);


  Future<void> _fetchData(String nombre) async {
    String apiUrl = 'https://api.genderize.io/?name=$nombre';

    final response = await http.get(Uri.parse(apiUrl));
    final data = json.decode(response.body);

    setState(() {
      persona = data;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Expanded(child: Container(
            child: Center(
              child: Text(name, style: const TextStyle(fontSize: 50),)
            ),
          )),

          TextField(
            controller: _textController,
            decoration: const InputDecoration(hintText: 'Inserte un nombre' ,border: OutlineInputBorder())
          ),
          MaterialButton(
            onPressed: () {
              setState(() {
                name = _textController.text;
                _fetchData(name);
              });
            },
            color: Colors.blue,
            child: const Text("Identificar", style: TextStyle(color: Colors.white),),
          )
        ],
      ),
    );
  }
}