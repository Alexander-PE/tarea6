import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:dio/dio.dart';

class Universidad extends StatefulWidget {
  const Universidad({super.key});

  @override
  State<Universidad> createState() => _UniversidadState();
}

class _UniversidadState extends State<Universidad> {

  final _textController = TextEditingController();

  List data = [];
  var nombre = "";
  var dominio="";
  var pagina = "";
  int largo = 0;

  Future<void> getUni(String pais) async {
    try {
      var response = await Dio().get('http://universities.hipolabs.com/search?country=$pais');
      data = response.data;
      largo = response.data.length;

      print(data);
      // print(response.data);
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    // getUni("Dominican Republic");
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextField(
            controller: _textController,
            decoration: const InputDecoration(hintText: 'Inserte un pais' ,border: OutlineInputBorder())
          ),
          MaterialButton(
            onPressed: () async{
              await getUni(_textController.text);
              setState(() {});
            },
            color: Colors.blue,
            child: const Text("Calcular", style: TextStyle(color: Colors.white),),
          ),
          Expanded(child: 
          
          ListView.builder(
            itemCount: largo,
            itemBuilder: (context, index){
              return BuildCard(index, data);
            },
          )
          )
        ],
      ),
    );
  }
}


Widget BuildCard(int index, List datos) => Container(
  color: Colors.grey,
  width: double.infinity,
  height: 100,
  child: Center(child: Column(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(datos[index]['name'], style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),), 
      Text("Dominio: ${datos[index]['domains'][0]}", style: const TextStyle(fontWeight: FontWeight.bold)), 
      InkWell(
        child: const Text("Ir a la pagina web", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        onTap: () => launch('${datos[index]['web_pages'][0]}')
      ),
      const Divider(
            height: 20,
            thickness: 5,
            endIndent: 0,
            color: Colors.white,
          ),
    ],
  )),
);