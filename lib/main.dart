import 'package:flutter/material.dart';

// imoprting screens
import 'package:mobile_app/screens/login.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'SmartLender',
      theme: new ThemeData(

        primarySwatch: Colors.blue,
      ),

    routes: <String,WidgetBuilder>{
      '/Login' : (BuildContext context) => new Login(),
      '/Home' : (BuildContext context) => new MyHomePage(),
    },
      home: new MyHomePage(title: 'Home'),
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
      appBar: new AppBar(

        title: new Text('HOME'),
        actions: <Widget>[
          new IconButton(icon: new Icon(Icons.exit_to_app), onPressed: () {
            Navigator.pushNamed(context, '/Login');

          }),
        ],
      ),
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
//      This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
