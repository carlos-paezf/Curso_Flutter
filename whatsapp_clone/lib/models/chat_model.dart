class ChatModel {
  final String name;
  String message;
  final String time;
  final String imagenURL;

  ChatModel({this.name, this.message, this.time, this.imagenURL});
}

List<ChatModel> messageData = [
  new ChatModel(
    name: 'David Ferrer',
    message: 'Chat falso',
    time: '7:34 p.m',
    imagenURL: 'assets/perfil/df.jpg'
  ),
  new ChatModel(
    name: 'Arturo Marin',
    message: 'Es solo un clon',
    time: '9:14 a.m',
    imagenURL: 'assets/perfil/am.jpg'
  ),
  new ChatModel(
    name: 'Esteban Olarte',
    message: 'Sticker',
    time: 'Ayer',
    imagenURL: 'assets/perfil/eo.jpg'
  ),
  new ChatModel(
    name: 'Laura Sanchez',
    message: 'Nahhh, no hay aún',
    time: '5/8/20',
    imagenURL: 'assets/perfil/ls.jpg'
  )
];
