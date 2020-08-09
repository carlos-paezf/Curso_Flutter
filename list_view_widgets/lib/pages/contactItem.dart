import 'package:flutter/material.dart';
import 'package:list_view_widgets/model/ContactModel.dart';

class ContactItem extends StatelessWidget {
  //variable final de contactos basado en el Modelo
  final ContactModel _contact;
  //Constructor
  const ContactItem(this._contact);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      //Avatar del contacto
      leading: new CircleAvatar(
          //En este caso no hay imagen, solo color de fondo
          backgroundColor: Colors.deepPurple,
          child: Text(
            //Primer caracter del String
            _contact.name[0],
            //Color de la letra
            style: TextStyle(color: Colors.white),
          )),
      //Nombre del contacto
      title: new Text(_contact.name),
      //Datos adicionales
      subtitle: new Text(_contact.email),
    );
  }
}
