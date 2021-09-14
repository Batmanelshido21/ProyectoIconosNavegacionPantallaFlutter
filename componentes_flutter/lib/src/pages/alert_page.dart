import 'package:flutter/material.dart';

class AlertPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Página de alertas"),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(
          child: Text("Mostrar alerta"),
          style: ElevatedButton.styleFrom(
            primary: Colors.green,
            shape: StadiumBorder(),
          ),
          onPressed: (){
            _mostrarAlerta(context);
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.logout),
        onPressed: (){
          Navigator.pop(context);
        },
      ),
    );
  }

  void _mostrarAlerta(BuildContext context){
    showDialog(
      context: context, 
      barrierDismissible: true,
      builder: (context){
        return AlertDialog(
          shape:  RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          title: Text("Titulo"),
          content:Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text("Este es el contenido de la caja de alerta"),
              FlutterLogo(size: 100.0,),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed:(){
                Navigator.of(context).pop();
              }, 
              child: Text("Cancelar")),
               TextButton(
              onPressed:(){
                 Navigator.of(context).pop();
              }, 
              child: Text("Aceptar"))
          ],
        );
      }
      );
  }

}