import 'package:flutter_project/widgets/add.dart';
import 'package:flutter_project/widgets/ajustes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/widgets/information.dart';
import 'package:flutter_project/widgets/map.dart';
import 'package:flutter_project/Routes.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        home: new DWidget(),
        routes: <String, WidgetBuilder>{
          Routes.map: (BuildContext context) => new MapPage(),
          Routes.information: (BuildContext context) => new InfoPage(),
          Routes.settings: (BuildContext context) => new SettingsPage(),
          Routes.addSpotType: (BuildContext context) => new AddPage(),
        }
    );
  }
}

class DWidget extends StatelessWidget {

  @override
  Widget build (BuildContext context) {
    return new Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
          title: Text("Plazas de Parking Reguladas",textAlign: TextAlign.center),backgroundColor: Colors.lightBlueAccent),
      body: MapScreen(),
    );
  }
}

class AppDrawer extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children:<Widget>[
          _createHeader(),
           new ListTile(
              leading: Icon(Icons.map, color: Colors.black, size: 28 ),
              title: Text("Map",style: TextStyle(color: Colors.black),) ,
              onTap: () {
                Navigator.pushNamed(context, Routes.map);
              },
          ),
          new ListTile(
            leading: Icon(Icons.info,color: Colors.black),
            title: Text("Information",style: TextStyle(color: Colors.black),) ,
            onTap: () {
              Navigator.pushReplacementNamed(context, Routes.information);
            },
          ),

          new ListTile(
            leading: Icon(Icons.settings,color: Colors.black),
            title: Text("Settings",style: TextStyle(color: Colors.black),) ,
            onTap: () {
              Navigator.pushNamed(context, Routes.settings);
            },
          ),
          new ListTile(
            leading: Icon(Icons.group_add,color: Colors.black),
            title: Text("Add City/Spot type",style: TextStyle(color: Colors.black),) ,
            onTap: () {
              Navigator.pushNamed(context, Routes.addSpotType);
            },
          ),
          new ListTile(
            leading: Icon(Icons.exit_to_app,color: Colors.black
            ),
            title: Text("Log out",style: TextStyle(color: Colors.black),) ,
            onTap: () {
            },
          )
        ],
      ) ,
    );
  }
}



Widget _createHeader(){
  return UserAccountsDrawerHeader(
    accountName: Text("Usuario"),
    accountEmail: Text("usuario@gmail.com"),
    decoration: BoxDecoration(
        color: Colors.lightBlueAccent,
        image: DecorationImage(image: NetworkImage(""),
            fit : BoxFit.cover
        )
    ),
  );
}





