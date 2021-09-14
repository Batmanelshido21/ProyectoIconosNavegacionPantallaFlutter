import 'dart:math';

import 'package:flutter/material.dart';
 
 class AnimatedContainerPage extends StatefulWidget
  {
 
   @override
   _AnimatedContainerPageState createState() => _AnimatedContainerPageState();

 }
 
 class _AnimatedContainerPageState extends State<AnimatedContainerPage> {
   
   double _width = 50.0;
   double _height = 50.0;
   Color _color = Colors.green;
   BorderRadiusGeometry _borderRadius = BorderRadius.circular(8.0);

   @override
   Widget build(BuildContext context) {
     return Scaffold(
        appBar: AppBar(
          title: Text("Páginda del contenedor"),
          centerTitle: true,
        ),
        body: Center(
          child: AnimatedContainer(
            width: _width,
            height: _height,
            duration: Duration(seconds: 1),
            curve: Curves.bounceIn,
            decoration: BoxDecoration(
              borderRadius: _borderRadius,
              color: _color,
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.play_arrow),
          onPressed: (){
            _cambiarForma();
          },
        ),
     );
   }

  void _cambiarForma() {
    final random = Random();

    setState(() {
      _width=random.nextInt(300).toDouble();
    _height=random.nextInt(300).toDouble();
    _color = Color.fromRGBO(
      random.nextInt(355), 
      random.nextInt(355), 
      random.nextInt(355), 
      1);
      _borderRadius = BorderRadius.circular(random.nextInt(100).toDouble());
    });

  }
 }