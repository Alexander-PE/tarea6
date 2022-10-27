import 'package:flutter/material.dart';

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Image.asset("assets/images/foto.jpg", width: 250, height: 250,),
              const Text("Alexander Perez", style: TextStyle(fontSize: 30),),
              const Text("alexander.pereze02@gmail.com",style: TextStyle(fontSize: 25),)
          ]));
  }
}