import 'package:flutter/cupertino.dart';
import 'package:dio/dio.dart';

class Clima extends StatefulWidget {
  const Clima({super.key});

  @override
  State<Clima> createState() => _ClimaState();
}


class _ClimaState extends State<Clima> {

  var region = "";
  var temp = 0;

  Future<void> getClima() async {
    try {
      var response = await Dio().get('http://api.weatherstack.com/current?access_key=cc34c25be08a9e767cf2e068a73db686&query=Dominican%20Republic');
      region = response.data['location']['region'];
      temp = response.data['current']['temperature'];
      print(temp);
      print(region);
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    getClima();
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("El clima en Santo Domingo, $region fue de:", style: const TextStyle(fontSize: 30),),
          Text("$temp° Celcius", style: const TextStyle(fontSize: 30),)
        ]
      ),
    );
  }
}