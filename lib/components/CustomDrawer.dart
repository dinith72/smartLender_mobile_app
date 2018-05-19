import 'package:flutter/material.dart';

class CustomDrawer{

  Drawer getDrawer(context){
    return (
      new Drawer(
        child: new Container(
          padding: new EdgeInsets.all(20.0),
          child: new Column(
            children: <Widget>[
//                  adding some drawer tiles
              new FlatButton.icon(
                  onPressed: (){},
                  icon: new Icon(Icons.list),
                  label: new Text('Demo')
              ),
              new FlatButton.icon(
                  onPressed: (){},
                  icon: new Icon(Icons.settings),
                  label: new Text('Settings')
              ),
//
            ],
          ),
        ),
      )
    );
  }
}