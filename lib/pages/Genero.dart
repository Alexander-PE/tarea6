// ignore: file_names
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class Genero extends StatefulWidget {
  const Genero({super.key});

  @override
  State<Genero> createState() => _GeneroState();
}

class _GeneroState extends State<Genero> {

  final _textController = TextEditingController();

  var gen = "";
  var colorr = Colors.white;


  Future<void> getGender(String nombre) async {
    try {
      var response = await Dio().get('https://api.genderize.io/?name=$nombre');
      gen = response.data['gender'];
      if(gen == "male"){
        colorr = Colors.blue;
      }else{
        colorr = Colors.pink;
      }
      // print(response.data['gender']);
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          FractionalTranslation(
            translation: const Offset(0, 0),
            child: SizedBox(
              width: 110,
              height: 110,
              child: Container(
                height:  1,
                width: 1,
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: ColoredBox(color: colorr),
              )
            ),
          ),

          TextField(
            controller: _textController,
            decoration: const InputDecoration(hintText: 'Inserte un nombre' ,border: OutlineInputBorder())
          ),
          
          MaterialButton(
            onPressed: () async{
              await getGender(_textController.text);
              setState(() {});
            },
            color: Colors.blue,
            child: const Text("Identificar", style: TextStyle(color: Colors.white),),
          )
        ],
      ),
    );
  }
}