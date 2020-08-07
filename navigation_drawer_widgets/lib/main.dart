import 'package:flutter/material.dart';
import 'package:navigation_drawer_widgets/pages/home.dart';
import 'package:navigation_drawer_widgets/pages/settings.dart';
import 'package:navigation_drawer_widgets/pages/account.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Navigation Drawer Widgets',
        theme: ThemeData(
          primarySwatch: Colors.deepOrange,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Home(title: 'Navigation Drawer Widgets'),
        //Obtener las rutas hacia donde nos redirecciona
        routes: <String, WidgetBuilder>{
          Settings.route: (BuildContext context) => new Settings(),
          Account.route: (BuildContext context) => new Account()
        });
  }
}
