import 'package:componentes_flutter/src/providers/menu_provider.dart';
import 'package:componentes_flutter/src/utils/icono_string_util.dart';
import 'package:flutter/material.dart';


class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text("Componentes de home"),
        centerTitle: true,
      ),
      body: _lista(),
    );
  }

  Widget _lista() {
    return FutureBuilder(
      future: menuProvider.cargarData(),
      initialData: [],
      builder: (context, AsyncSnapshot snapshot){
        print('Builder');
        print(snapshot.data);
        return ListView(
        children: _listaItems(snapshot.data,context),
        );
      }
    );
  }

 List<Widget> _listaItems(List<dynamic> data,BuildContext context){
  final List<Widget> opciones = [];
  data.forEach((opt){
    final widgetTemp = ListTile(
      title: Text(opt['texto']),
      leading: getIcon(opt['icon']),
      trailing: Icon(Icons.keyboard_arrow_right, color: Colors.green),
      onTap: (){
        Navigator.pushNamed(context, opt['ruta']);
      },
    );
    opciones..add(widgetTemp)
            ..add(Divider(
              color: Colors.green,
              height: 30,
            ));
  });
  return opciones;
  }
}
