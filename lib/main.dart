import 'package:flutter/material.dart';

//importing components
import 'package:mobile_app/components/appBar.dart';
import 'package:mobile_app/components/CustomDrawer.dart';

// imoprting screens
import 'package:mobile_app/screens/login.dart';
import 'package:mobile_app/screens/paymentsManager.dart';


void main() => runApp(new MyApp());

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
    },
      home: new Login(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);


  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {




  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      appBar: new CustomAppBar().getAppBar(context,'Summary'),
      body: new Center(

        child: new Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(
              'You have pushed the button this many times:',
            ),

          ],
        ),
      ),
      drawer: new CustomDrawer().getDrawer(context),
      
//      This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
