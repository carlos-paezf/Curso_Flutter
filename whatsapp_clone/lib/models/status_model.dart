import 'package:whatsapp_clone/models/chat_model.dart';

//! Clase para definir los atributos de los estados
class StatusModel {
  //? Atributos
  final String name;
  final String time;
  final String imageURL;

  //? Constructor
  StatusModel({this.name,this.time, this.imageURL});
}

//! Lista de estados 
List<StatusModel> statusdata = [
  new StatusModel(
    name: 'Mi estado', 
    time: 'Añade una actualización', 
    imageURL: 'assets/perfil/yo.jpg',
  ),
  new StatusModel(
    name: messageData[2].name,
    time: 'hace 44 minutos',
    imageURL: messageData[2].imagenURL,
  ),
  new StatusModel(
    name: messageData[3].name,
    time: 'Ayer 11:11 p.m.',
    imageURL: messageData[3].imagenURL,
  ),
  new StatusModel(
    name: messageData[1].name,
    time: 'Hoy 8:22 a.m.',
    imageURL: messageData[1].imagenURL,
  )
];