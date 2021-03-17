import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_project/main.dart';
import 'package:http/http.dart' as http;
import 'package:package_info/package_info.dart';
import 'package:flutter_project/utils/constants.dart';

class InfoPage extends StatelessWidget{

  static const String routeName = '/information';

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Text("Information"),
        ),
        drawer: AppDrawer(),
        body: InformationScreen());
  }
}

class InformationScreen extends StatefulWidget{

  InformationScreen({Key key}) : super(key : key);
  @override
  InformationScreenState createState() => InformationScreenState();
}

class InformationScreenState extends State<InformationScreen> {
  Future<InformationData> post;
  Future<String> appVersion;

  @override
  void initState(){
    super.initState();
    post = fetchInformation();
    appVersion = getAppVersion();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BottomAppBar(
        child: SingleChildScrollView(
          child: Column(
              children:<Widget>[
                Container(
                  width: 300 ,
                  height: 200 ,
                  child : Image.asset('assets/logocolor.png'),
                ),
                Container(
                  child: FutureBuilder<InformationData>(
                      future: post,
                      builder: (context, snapshot){
                        if(snapshot.hasData) {
                          return Container(margin:EdgeInsets.all(15.0),child:Center(child:Text(snapshot.data.texto),),);
                        }else if(snapshot.hasError){
                          return Text("${snapshot.error}");
                        }
                        return CircularProgressIndicator();
                      }
                  ),
                ),
                Container(
                  child: FutureBuilder<String>(
                      future: appVersion,
                      builder: (context, snapshot){
                        if(snapshot.hasData) {
                          return Container(margin:EdgeInsets.all(15.0),child:Center(child:Text(snapshot.data),),);
                        }else if(snapshot.hasError){
                          return Text("${snapshot.error}");
                        }
                        return CircularProgressIndicator();
                      }
                  ),
                ),
              ]
             ),
          ),
        ),
    );
  }

  Future<String> getAppVersion() async{
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    return packageInfo.version;
  }

  Future<InformationData> fetchInformation() async{

    String language = "es";

    final response = await http.get(Constants.API_GET_INFORMATION + language,
      headers: {HttpHeaders.authorizationHeader: Constants.PUBLIC_TOKEN},);

    if(response.statusCode == 200){
      print("respuesta:" + response.body);
      String recievedJson = response.body;
      List<dynamic> listJson = json.decode(recievedJson);
      return InformationData.fromJson(listJson[0]);
    } else {
      throw Exception('No pudieron cargarse los datos:' + response.body);
    }
  }
}



  class InformationData{
    String valor;
    String texto;

    InformationData({this.valor, this.texto});

      factory InformationData.fromJson(Map<String, dynamic> json){
        return InformationData(
          valor: json['value'],
          texto: json['text'],
        );
     }
  }





