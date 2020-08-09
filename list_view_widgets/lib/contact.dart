import 'package:flutter/material.dart';
import 'package:list_view_widgets/model/ContactModel.dart';
import 'package:list_view_widgets/pages/contactList.dart';

class Contact extends StatelessWidget {
  //Funcion que retorna una lista de contactos
  _buildList() {
    return <ContactModel>[
      const ContactModel(name: 'David Ferrer', email: 'david@ferrer'),
      const ContactModel(name: 'Carlos Paez', email: 'carlos@paez'),
      const ContactModel(name: 'Juan Hernandez', email: 'juan@hernandez')
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //llamado en el cuerpo a la lista de contactos
        body: new ContactList(_buildList()));
  }
}
