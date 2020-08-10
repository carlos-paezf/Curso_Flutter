import 'package:flutter/material.dart';
import 'package:whatsapp_clone/pages/camara.dart';
import 'package:whatsapp_clone/pages/chats.dart';
import 'package:whatsapp_clone/pages/estados.dart';
import 'package:whatsapp_clone/pages/llamadas.dart';

class WhatsAppHome extends StatefulWidget {
  WhatsAppHome({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _WhatsAppHomeState createState() => _WhatsAppHomeState();
}

class _WhatsAppHomeState extends State<WhatsAppHome>
    with SingleTickerProviderStateMixin {
  //Controllador para los Tabs
  TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = new TabController(length: 4, vsync: this);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.teal[900],
        bottom: new TabBar(
          isScrollable: true,
          labelPadding: EdgeInsets.symmetric(horizontal: 27.0),
          tabs: <Widget>[
            new Tab(icon: Icon(Icons.camera_alt, size: 20.0,),),
            new Tab(
              child: Text(
                'CHATS',
                style: TextStyle(fontSize: 12.0),
              ),
            ),
            new Tab(
              child: Text(
                'ESTADOS',
                style: TextStyle(fontSize: 12.0),
              ),
            ),
            new Tab(
              child: Text(
                'LLAMADAS',
                style: TextStyle(fontSize: 12.0),
              ),
            ),
          ],
          controller: _tabController,
        ),
      ),
      body: new TabBarView(
        children: <Widget>[
          new Camara(),
          new Chats(),
          new Estados(),
          new Llamadas()
        ],
        controller: _tabController,
      ),
    );
  }
}
