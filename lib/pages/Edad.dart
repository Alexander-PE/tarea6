// ignore: file_names
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class Edad extends StatefulWidget {
  const Edad({super.key});

  @override
  State<Edad> createState() => _EdadState();
}

class _EdadState extends State<Edad> {

  final _textController = TextEditingController();

  var x = 0;
  var etapa ="";
  var colorr = Colors.white;
  var imagen = "assets/images/White_full.png";
  String joven = "https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.pngwing.com%2Fes%2Fsearch%3Fq%3Djoven&psig=AOvVaw0BXk7hTw55lKrhJ5YtfTtc&ust=1666730654940000&source=images&cd=vfe&ved=0CAkQjRxqFwoTCOj6wdbd-foCFQAAAAAdAAAAABAE";

  Future<void> getAge(String nombre) async {
    try {
      var response = await Dio().get('https://api.agify.io/?name=$nombre');
      x = response.data['age'];
      if(x < 18){
        etapa = "joven";
        imagen = "assets/images/joven.jpg";
      }else if(x >=18 && x < 60){
        etapa = "adulto";
        imagen = "assets/images/adulto.jpg";
      }else{
        etapa = "anciano";
        imagen = "assets/images/anciano.jpg";
      }
      // print(response.data['age']);
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

          Text("$x"),
          Image.asset(imagen, width: 250, height: 250,),

          TextField(
            controller: _textController,
            decoration: const InputDecoration(hintText: 'Inserte un nombre' ,border: OutlineInputBorder())
          ),
          
          MaterialButton(
            onPressed: () async{
              await getAge(_textController.text);
              setState(() {});
            },
            color: Colors.blue,
            child: const Text("Calcular", style: TextStyle(color: Colors.white),),
          )
        ],
      ),
    );
  }
}