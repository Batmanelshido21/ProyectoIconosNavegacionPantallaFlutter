import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

class CardPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Página de cartas"),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.all(15),
        children: <Widget>[
          _cardTipo1(),
          SizedBox(height:30.0),
          _cardTipo2(),
           SizedBox(height:30.0),
        ],
      ),
    );
  }

 Widget _cardTipo1() {
   return Card(
     elevation: 3.0,
     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
     child: Column(
       children: <Widget>[
         ListTile(
           leading: Icon(Icons.photo_album, color: Colors.green,),
           title: Text("Soy el titulo perrón"),
           subtitle: Text("Soy el subtitulo perrón"),
         ),        
         Row(
           mainAxisAlignment: MainAxisAlignment.end,
           children: <Widget>[
             TextButton(onPressed: (){}, 
             child: Text("Cancelar")),
             TextButton(onPressed: (){}, 
             child: Text("Aceptar"))
           ],
         )
       ],      
     ),
   );  
 }

  Widget _cardTipo2() {
    final card = Container(
      child: Column(
        children: <Widget>[
          FadeInImage(
            placeholder: AssetImage("assets/jar-loading.gif"), 
            image: NetworkImage("https://fondosmil.com/fondo/7312.jpg"),
            fadeInDuration: Duration(milliseconds: 200),
            height: 300,
            fit: BoxFit.cover,
            ),
          Container(
            padding: EdgeInsets.all(15),
            child: Text("Hola soy batman",)
            )
        ],
      ),
    );
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        color: Colors.white,
        boxShadow: <BoxShadow>[
          BoxShadow(
            //sombra
            color: Colors.black26,
            //
            blurRadius: 10.0,
            spreadRadius: 2.0,
            offset: Offset(2.0,10.0) 
          )
        ]
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30.0),
        child: card,
      )
    );
  }
}