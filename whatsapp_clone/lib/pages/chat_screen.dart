import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:whatsapp_clone/models/chat_model.dart';

class ChatScreen extends StatefulWidget {
  final String name;
  ChatScreen({Key key, this.name}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> with TickerProviderStateMixin {
  final TextEditingController _textEditingController =
      new TextEditingController();
  final List<ChatMessage> _messages = <ChatMessage>[];
  bool _isTyped = false;
  void _handledSubmit(String text) {
    _textEditingController.clear();
    setState(() {
      _isTyped = false;
    });
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
                border: new OutlineInputBorder(
                  borderRadius: const BorderRadius.all(
                    const Radius.circular(30.0),
                  ),
                ),
                filled:false,
                hintStyle: TextStyle(color: Colors.grey[800], fontSize: 18.0),
                fillColor: Colors.white70,
                prefixIcon: Icon(Icons.tag_faces, size: 30.0),
                suffixIcon: Icon(Icons.camera_alt, size: 25.0,),
                contentPadding: EdgeInsets.all(15),
              ),
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
                  onTap: _isTyped
                      ? () => _handledSubmit(_textEditingController.text)
                      : null,
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

class ChatMessage extends StatelessWidget {
  const ChatMessage(
      {Key key, this.name, this.animationController, this.message})
      : super(key: key);
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
