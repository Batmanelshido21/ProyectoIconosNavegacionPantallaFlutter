import 'package:flutter/material.dart';

class HomePageTemp  extends StatelessWidget {

  final opciones = ['1','2','3','4','5','6','7','8','9','10'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
       title: Text("Componentes de flutter"),
       centerTitle: true,
     ),
     body: ListView(
       children: _crearItemsCorta()
     ),
    );
  }

  List<Widget> _crearWidgets(){

    List<Widget> lista = [];
    
    for (String opc in opciones){
      final tempoWidget = ListTile(
        title: Text(opc),
      );
      lista.add(tempoWidget);
      lista.add(Divider(
        color: Colors.green,
        height: 30,
      ));
    }
    return lista;
  }

  List<Widget> _crearItemsCorta(){
    var widgets = opciones.map((item){
      return Column(
        children: [
          ListTile(
            title: Text(item + '!'),
            subtitle: Text("Hola mundo"),
            leading: Icon(Icons.access_alarm_sharp),
            trailing: Icon(Icons.access_time_sharp),
            onTap: (){},
          ),
         Divider(
        color: Colors.green,
        height: 30,
      )
        ],
      );
    }).toList();
    return widgets;
  }

}