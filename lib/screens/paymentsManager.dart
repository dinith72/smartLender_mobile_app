import 'package:flutter/material.dart';
import 'package:mobile_app/main.dart';
import 'package:mobile_app/components/appBar.dart';
import 'package:mobile_app/components/CustomDrawer.dart';

class PaymentsManager extends StatefulWidget{
  @override
  _PaymentsManager createState() => new _PaymentsManager();
}

class _PaymentsManager extends State<PaymentsManager>{

  bool _switchVal = false;

  switchOnClick(bool val){
    setState(() {  // this method should be implemented in stateful widget
      _switchVal = val;
    });
  }
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new CustomAppBar().getAppBar(context,'Payments Manager'),
        body: new Container(
            padding: new EdgeInsets.all(32.0),
            child: new Center(
                child: new Column(
                    children: <Widget>[

                    ]
                )
            )
        ),
        drawer: new CustomDrawer().getDrawer(context) ,

    );
  }
}