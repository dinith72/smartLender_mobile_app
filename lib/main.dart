import 'package:flutter/material.dart';

//importing components
import 'package:mobile_app/components/appBar.dart';
import 'package:mobile_app/components/CustomDrawer.dart';


// imoprting screens
import 'package:mobile_app/screens/login.dart';
import 'package:mobile_app/screens/paymentsManager.dart';
import 'package:mobile_app/screens/Attendence.dart';
import 'package:mobile_app/screens/MemberInfo.dart';
import 'package:mobile_app/components/memberSelectionComponent.dart';
import 'package:mobile_app/screens/Home.dart';


void  main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'SmartLender',
      theme: new ThemeData(

        primarySwatch: Colors.amber,
      ),

    routes: <String,WidgetBuilder>{
      '/Login' : (BuildContext context) => new Login(),
      '/Home' : (BuildContext context) => new MyHomePage(),
      '/Payments' : (BuildContext context) => new PaymentsManager(),
      '/Attendence' : (BuildContext context) => new Attendence(),
      '/MemberInfo': (BuildContext context) => new MemberInfo(),
      '/MemberSelection' : (BuildContext context) => new Selectioncomponent(),
    },
      home: new Login(),
    );
  }
}

