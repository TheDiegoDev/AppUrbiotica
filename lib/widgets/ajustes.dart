import 'package:flutter/material.dart';
import 'package:flutter_project/main.dart';
import 'package:flutter_project/widgets/information.dart';
import 'package:flutter_project/widgets/add.dart';


class SettingsPage extends StatelessWidget {

  static const String routeName = '/settings';

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Text("Settings"),
        ),
        drawer: AppDrawer(),
        body: Center(
            child: Text("Ajustes")
        )
    );
  }

}

class SettingsScreen extends StatefulWidget{
  @override
  State<SettingsScreen> createState()=> SettingsScreenState();
}


class SettingsScreenState extends State<SettingsScreen> {

  @override
  void initState(){
    super.initState();


  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: BottomAppBar(
          child: Column(
            children: <Widget>[

            ],
          ),
        ),
      ),
    );

  }
}
