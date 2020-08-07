import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  Home({Key key, this.title}) : super(key: key);
  //Titulo pasado por parametro
  final String title;
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //Indice del item seleccionado
  int _selectedDrawerItem = 1;
  //Items pasados por el widget de Drawer
  //Crear el widget Drawner
  Drawer _getDrawer(BuildContext context) {
    //Titulo del Drawer
    var header = new DrawerHeader(child: new Text('Ajustes'));
    //Informacion acerca de la App
    var info = new AboutListTile(
      child: Text('Info App'),
      //Icono en la ventana emergente
      applicationIcon: new Icon(Icons.whatshot),
      //Icono visible en la lista
      icon: new Icon(Icons.whatshot),
      applicationVersion: 'v1.0.0',
      applicationName: 'Navigation Drawer Widgets',
    );
    //Lista reutilizable para las caracteristicas de los iconos
    ListTile _getItem(Icon icon, String description, String route, int pos) {
      return new ListTile(
        leading: icon,
        title: new Text(description),
        //Obtener el puesto de la seleccion
        selected: (pos == _selectedDrawerItem),
        //Al presionar
        onTap: () {
          setState(() {
            //Guiar a la ruta
            Navigator.of(context).pushNamed(route);
            //Asumir el indice de posicion
            _selectedDrawerItem = pos;
          });
        },
      );
    }

    //Lista visible de menú
    ListView listView = new ListView(
      children: <Widget>[
        //Cabecera de informacacion de Usuario
        UserAccountsDrawerHeader(
          accountName: Text('Carlos-PaezF'),
          accountEmail: Text('flutter.flutter@flutter.com'),
          currentAccountPicture: CircleAvatar(
            backgroundColor: Colors.red[900],
            child: Text(
              'CP',
              style: TextStyle(fontSize: 30.0),
            ),
          ),
        ),
        //Configurado anteriormente
        header,
        //Items empleando funcion configurada
        _getItem(new Icon(Icons.settings), 'Confuguración', '/settings', 0),
        _getItem(new Icon(Icons.home), 'Principal', '/', 1),
        _getItem(new Icon(Icons.account_circle), 'Cuenta', '/account', 2),
        info
      ],
    );
    return new Drawer(
        //Retornar la lista de items
        child: listView);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      //Agregar el widgets Drawner
      drawer: _getDrawer(context),
    );
  }
}
