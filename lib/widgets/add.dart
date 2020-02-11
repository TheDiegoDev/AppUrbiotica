import 'package:flutter/material.dart';
import 'package:flutter_project/main.dart';

class AddPage extends StatelessWidget {

  static const String routeName = '/add';

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Text("Add Spot Type"),
        ),
        drawer: AppDrawer(),
        body: Center(
            child: Text("Pantalla añadir Spot Type")
        )
    );
  }
}


class AddScreen extends StatefulWidget{
  @override
  State<AddScreen> createState()=> AddScreenState();
}


class AddScreenState extends State<AddScreen> {

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