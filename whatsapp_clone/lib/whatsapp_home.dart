import 'package:flutter/material.dart';
import 'package:whatsapp_clone/pages/camara.dart';
import 'package:whatsapp_clone/pages/chats.dart';
import 'package:whatsapp_clone/pages/estados.dart';
import 'package:whatsapp_clone/pages/llamadas.dart';
import 'package:whatsapp_clone/pages/contactos.dart';

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
    _tabController = new TabController(length: 4, vsync: this, initialIndex: 1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 10,
        title: Text(widget.title),
        backgroundColor: Colors.black,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {},
          )
        ],
        bottom: new TabBar(
          indicatorSize: TabBarIndicatorSize.tab,
          indicatorColor: Colors.white,
          indicatorWeight: 3.0,
          isScrollable: true,
          labelPadding: EdgeInsets.symmetric(horizontal: 27.0),
          tabs: <Widget>[
            new Tab(
              icon: Icon(
                Icons.camera_alt,
                size: 20.0,
              ),
            ),
            new Tab(
              child: Text(
                'CHATS',
                style: TextStyle(fontSize: 15.5),
              ),
            ),
            new Tab(
              child: Text(
                'ESTADOS',
                style: TextStyle(fontSize: 15.5),
              ),
            ),
            new Tab(
              child: Text(
                'LLAMADAS',
                style: TextStyle(fontSize: 15.5),
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
      floatingActionButton: new FloatingActionButton(
          onPressed: () {
            var route = new MaterialPageRoute(
                builder: (BuildContext context) => new Contacts());
            Navigator.of(context).push(route);
          },
          backgroundColor: Colors.black,
          child: new Icon(Icons.sms)),
    );
  }
}
