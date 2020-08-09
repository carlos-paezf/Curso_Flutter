import 'package:flutter/material.dart';
import 'package:list_view_widgets/model/ContactModel.dart';
import 'package:list_view_widgets/pages/contactItem.dart';

class ContactList extends StatelessWidget {
  //Lista de contactos con la estructura del Modelo
  final List<ContactModel> _contacts;
  //Constructor
  ContactList(this._contacts);

  //Funcion que que mapea los contactos para pasarlos a los items
  List<ContactItem> _buildContactList() {
    return _contacts
        //recorrido de los contactos almacenados
        .map((contact) => ContactItem(contact))
        //listado
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      //listado de contactos
      children: _buildContactList(),
    );
  }
}
