//! Clase para definir los contactos y sus caracteristicas
class ContactModel {
  //? Atributos
  final String name;
  String status;
  final String imagenURL;

  //? Constructor
  ContactModel({this.name, this.status, this.imagenURL});
}

//! Lista de contactos
List<ContactModel> contactData = [
  new ContactModel(
    name: 'David Ferrer',
    status: 'Chat falso',
    imagenURL: 'assets/perfil/df.jpg'
  ),
  new ContactModel(
    name: 'Arturo Marin',
    status: 'Es solo un clon',
    imagenURL: 'assets/perfil/am.jpg'
  ),
  new ContactModel(
    name: 'Esteban Olarte',
    status: 'Sticker',
    imagenURL: 'assets/perfil/eo.jpg'
  ),
  new ContactModel(
    name: 'Laura Sanchez',
    status: 'Nahhh, no hay aún',
    imagenURL: 'assets/perfil/ls.jpg'
  )
];
