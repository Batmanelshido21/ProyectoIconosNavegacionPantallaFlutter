import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  String _nombre=""; 
  String _email="";
  String _password="";
  String _fecha="";
  String _opcionSeleccionada="Elegir opción";
  List<String> _poderes=["Elegir opción","Volar","Rayos laser", "Super velocidad", "Super fuerza"]; 

  TextEditingController _fechaInput = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
       title: Text("Página de inputs"),
       centerTitle: true,
     ),
     body: ListView(
       padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 20.0),
       children: <Widget>[
         _crearInput(),
         Divider(),
         _crearEmail(),
          Divider(),
         _crearPassword(),
          Divider(),
         _crearFecha(context),
          Divider(),
          _crearDropDown()
       ]
     ),
    );
  }

  Widget _crearInput() {
   return TextField(
     textCapitalization: TextCapitalization.sentences,
     decoration: InputDecoration(
       border: OutlineInputBorder(
         borderRadius: BorderRadius.circular(20.0)
       ),
       counter: Text("Letras ${_nombre.length}"),
       hintText: "Nombre y apellidos",
       labelText: "Nombre",
       helperText: "No intruduzca caracteres especiales",
       suffixIcon: Icon(Icons.accessibility),
       icon: Icon(Icons.account_circle)
     ),
     onChanged: (valor){
       setState((){
         _nombre=valor;
       });
     },
   );
 }

 Widget _crearEmail() {
      return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
      border: OutlineInputBorder(
         borderRadius: BorderRadius.circular(20.0)
       ),
       counter: Text("Letras ${_email.length}"),
       hintText: "Correo electrónico",
       labelText: "Email",
       helperText: "@gmail,@hotmail",
       suffixIcon: Icon(Icons.alternate_email),
       icon: Icon(Icons.email)
     ),
     onChanged: (valor){
       setState((){
         _email=valor;
       });
     },
   );
 }

 Widget _crearPassword() {
      return TextField(
      obscureText: true,
      decoration: InputDecoration(
      border: OutlineInputBorder(
         borderRadius: BorderRadius.circular(20.0)
       ),
       counter: Text("Letras ${_password.length}"),
       hintText: "Introduce tu contraseña",
       labelText: "Password",
       helperText: "Combina caracteres",
       suffixIcon: Icon(Icons.password_outlined),
       icon: Icon(Icons.password)
     ),
     onChanged: (valor){
       setState((){
         _password=valor;
       });
     },
   );
 }

 Widget _crearFecha(BuildContext context) {
      return TextField(
      controller: _fechaInput,
      enableInteractiveSelection: false,
      decoration: InputDecoration(
      border: OutlineInputBorder(
         borderRadius: BorderRadius.circular(20.0)
       ),
       counter: Text("Letras ${_fecha.length}"),
       hintText: "Introduce tu fecha de nacimiento",
       labelText: "Fecha",
       helperText: "Selecciona fecha valida",
       suffixIcon: Icon(Icons.date_range_rounded),
       icon: Icon(Icons.date_range_sharp)
     ),
     onTap: (){
       FocusScope.of(context).requestFocus(new FocusNode());
       _selectDate(context);
     },
   );
 }

  _selectDate(BuildContext context) async{
    DateTime? picked = await showDatePicker(
      context: context, 
      initialDate: new DateTime.now(), 
      firstDate: new DateTime(2021), 
      lastDate: new DateTime(2025),
      locale: Locale('es','ES')
    );

    if(picked!=null){
      setState(() {
        _fecha=picked.toString();
        _fechaInput.text=_fecha;
      });
    }
  }

  List<DropdownMenuItem<String>> getOpcionesDropdown(){
    List<DropdownMenuItem<String>> lista =  [];
      _poderes.forEach((poder) {
      lista.add(DropdownMenuItem(
        child: Text(poder),
        value: poder,
      ));
    });
    return lista;
  }
 Widget _crearDropDown() {
   return Row(
     children: <Widget>[
       Icon(Icons.select_all),
       SizedBox(width: 30.0,),
       DropdownButton(
        value: _opcionSeleccionada,
        items: getOpcionesDropdown(),
        onChanged: (opt){
          setState(() {
            _opcionSeleccionada = opt.toString();
          });
        }
      )
     ],
   );
 }


}