import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {

  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  
  double _valorSlider=100.0;
  bool _bloquearCheckBoX=false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Página de Sliders"),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Container(
        padding: EdgeInsets.only(top: 50.0),
        child: Column(children: <Widget>[
          _crearSlider(),
          Divider(),
          _crearCheckBox(),
          Divider(),
          _crearSwitch(),
          Expanded(
            child: _crearImagen()
            )
        ],
        ),
      ),
    );
  }

  Widget _crearSlider() {
       return Slider(
         label: 'Tamaño de la imagen',
         min: 10.0,
         max: 400.0,
         value: _valorSlider, 
         activeColor: Colors.black,
         onChanged:(_bloquearCheckBoX)? null : (valor){
           setState(() {
             _valorSlider=valor;            
           });
         },
      );
  }

  Widget _crearImagen() {
    return Image(
      image: NetworkImage("https://images4.alphacoders.com/983/983720.jpg"),
      width: _valorSlider,
      fit: BoxFit.contain,
    );

  }

  Widget _crearCheckBox() {
    return CheckboxListTile(
      title: Text("Habilitar/Deshabilitar"),
      value: _bloquearCheckBoX, 
      onChanged: (valor){
        setState(() {
          _bloquearCheckBoX=valor!;
        });
      });
  }

  Widget _crearSwitch() {
    return SwitchListTile(
     title: Text("Habilitar/Deshabilitar"),
      value: _bloquearCheckBoX, 
      onChanged: (valor){
        setState(() {
          _bloquearCheckBoX=valor;
        });
      },
     );
  }

}