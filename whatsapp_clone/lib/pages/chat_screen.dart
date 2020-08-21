import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:whatsapp_clone/models/chat_model.dart';

class ChatScreen extends StatefulWidget {
  //* Atributos
  final String name;
  ChatScreen({Key key, this.name}) : super(key: key);
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

//! Widget que muestra la pantalla de chats
class _ChatScreenState extends State<ChatScreen> with TickerProviderStateMixin {
  //? Atributo para controlar la entrada del texto
  final TextEditingController _textEditingController =
      new TextEditingController();
  //? Lista de mensajes
  final List<ChatMessage> _messages = <ChatMessage>[];
  bool _isTyped = false;

  //? Funcion para los mensajes
  void _handledSubmit(String text) {
    //? Limpiar el textfield luego de enviar
    _textEditingController.clear();
    setState(() {
      _isTyped = false;
    });
    //? Animacion para los mensajes que se estan enviando
    ChatMessage message = new ChatMessage(
      message: text,
      animationController: new AnimationController(
          duration: new Duration(milliseconds: 700), vsync: this),
      name: widget.name,
    );
    setState(() {
      _messages.insert(0, message);
      var data =
          messageData.firstWhere((element) => element.name == widget.name);
      data.message = message.message;
    });
    message.animationController.forward();
  }

  Widget _buildTextComposer() {
    return new Container(
      padding: EdgeInsets.only(left: 8.0),
      child: new Row(
        children: <Widget>[
          new Flexible(
            //! Campo de texto para el mensaje
            child: new TextField(
              autofocus: true,
              controller: _textEditingController,
              onChanged: (String message) {
                setState(() {
                  _isTyped = message.length > 0;
                });
              },
              decoration: InputDecoration(
                hintText: 'Escribe un mensaje',
                //! Forma circular de los bordes
                border: new OutlineInputBorder(
                  borderRadius: const BorderRadius.all(
                    const Radius.circular(30.0),
                  ),
                ),
                filled:false,
                hintStyle: TextStyle(color: Colors.grey[800], fontSize: 18.0),
                fillColor: Colors.white70,
                //! Icono al principio del campo de Texto
                prefixIcon: Icon(Icons.tag_faces, size: 30.0),
                //! Icono al final del campo de Texto
                suffixIcon: Icon(Icons.camera_alt, size: 25.0,),
                contentPadding: EdgeInsets.all(15),
              ),
              //! Funciones del teclado
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.send,
              textCapitalization: TextCapitalization.sentences,
              cursorColor: Colors.green,
              cursorWidth: 2.0,
              mouseCursor: MouseCursor.defer,
              maxLines: 1,
            ),
          ),
          new Container(
            //! Icono de enviar mensaje
            padding: EdgeInsets.only(left: 5.0, right: 5.0),
            child: ClipOval(
              child: Material(
                color: Colors.black, // button color
                child: InkWell(
                  splashColor: Colors.green, // inkwell color
                  child: SizedBox(
                    width: 50,
                    height: 50,
                    child: Icon(
                      Icons.send,
                      color: Colors.white,
                      size: 25.0,
                    ),
                  ),
                  //! Funcion al presionar, operador ternario
                  onTap: _isTyped
                      ? () => _handledSubmit(_textEditingController.text) //? TRUE
                      : null, //? FALSE
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //* Traer el nombre del usuario
        title: Text(widget.name),
        backgroundColor: Colors.black,
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            new Flexible(
              child: ListView.builder(
                padding: new EdgeInsets.all(15.0),
                reverse: true,
                itemBuilder: (_, int index) => _messages[index],
                itemCount: _messages.length,
              ),
            ),
            Divider(
              height: 1.0,
            ),
            Container(
              child: _buildTextComposer(),
            )
          ],
        ),
      ),
    );
  }
}

//! Configuracion del mensaje flotante
class ChatMessage extends StatelessWidget {
  //! Constructor
  const ChatMessage(
      {Key key, this.name, this.animationController, this.message})
      : super(key: key);
  //! Atributos
  final String name;
  final AnimationController animationController;
  final String message;

  @override
  Widget build(BuildContext context) {
    return SizeTransition(
      sizeFactor: new CurvedAnimation(
          parent: animationController, curve: Curves.easeInOutQuart),
      child: new Container(
        margin: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Container(
              margin: const EdgeInsets.only(right: 10.0),
              child: new CircleAvatar(child: new Text(name[0])),
            ),
            new Expanded(
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Text(name, style: Theme.of(context).textTheme.subhead),
                  new Container(
                    margin: EdgeInsets.only(top: 5.0),
                    child: Text(message),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
