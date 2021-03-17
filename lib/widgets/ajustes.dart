import 'package:flutter/material.dart';
import 'package:flutter_project/main.dart';
import 'package:flutter_project/widgets/information.dart';
import 'package:flutter_project/widgets/add.dart';
import 'package:app_settings/app_settings.dart';


class SettingsPage extends StatelessWidget {

  static const String routeName = '/settings';

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Text("Settings",textAlign: TextAlign.center),backgroundColor: Colors.lightBlueAccent),
        drawer: AppDrawer(),
        body: SettingsScreen(),
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
    return Scaffold(
        body: BottomAppBar(
        child: SingleChildScrollView(
          child:  new Container(
            child: Column(
              children: <Widget>[
                Container(
                  height: 25,
                ),
            Row(
              children: <Widget>[
                Container(
                  child: Text('  Localicacion:',style: TextStyle(color: Colors.blueAccent,fontWeight: FontWeight.bold),),
                ),
                ]
            ),

                Row(
                children: <Widget>[
                  Icon(
                    Icons.location_on,
                    color: Colors.blueAccent,
                  ),
                  Container(
                    width: 20,
                  ),
                  Container(
                    child: ButtonTheme(
                      minWidth: 200,
                      buttonColor: Colors.white,
                      child:  RaisedButton(
                        onPressed: AppSettings.openLocationSettings,
                        child: Text('Open Location Settings'),
                      ),
                    ),
                  ),
                ]
                ),

              ],
            ),
          ),
        ),
        ),
        );

  }
}
