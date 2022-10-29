import 'package:flutter/material.dart';
import 'package:tarea6/pages/Clima.dart';
import 'package:tarea6/pages/Edad.dart';
import 'package:tarea6/pages/Genero.dart';
import 'package:tarea6/pages/Universidad.dart';
import 'package:tarea6/pages/contratame.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  
  int page = 0;
  List paginas = const [
    Genero(),
    Edad(),
    Universidad(),
    Clima(),
    About()
  ];

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return MaterialApp(
      home: Scaffold(
        appBar :AppBar(title: const Text("Tarea 6"), centerTitle: true,),
        drawer: Drawer(
          child: ListView(
            padding: const EdgeInsets.only(top: 40),
            children:  [
              ListTile(title: const Text("Nombre/Genero"), onTap: (){
                setState(() {
                  page=0;
                });
              },),
              ListTile(title: const Text("Edad/Etapa"), onTap: (){
                setState(() {
                  page=1;
                });
              },),
              ListTile(title: const Text("Universidad"), onTap: (){
                setState(() {
                  page=2;
                });
              },),
              ListTile(title: const Text("Clima"), onTap: (){
                setState(() {
                  page=3;
                });
              },),
              ListTile(title: const Text("Acerca de"), onTap: (){
                setState(() {
                  page=4;
                });
              },)
          ],),
        ),
        body: paginas[page],
      ),
    );
  }
}