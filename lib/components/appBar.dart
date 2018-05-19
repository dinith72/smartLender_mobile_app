import 'package:flutter/material.dart';
class CustomAppBar {

  AppBar getAppBar(context){
    return(
        new AppBar(
          backgroundColor: new Color.fromRGBO(204, 159, 14, 1.0), // color can be taken as r , g, b , opacity
          title: new Text('Summary' ,
            textAlign: TextAlign.center ,
            style: new TextStyle(color: Colors.white , fontWeight: FontWeight.bold , fontSize: 25.0),
          ),
          actions: <Widget>[
            new Container(
//                color:  new Color.fromRGBO(232, 183, 25, 0.9),
                child: new Row(
                  children: <Widget>[
                    new Icon(Icons.people , color: Colors.white),
                    new IconButton(
                        icon: new Icon(Icons.exit_to_app ,color: Colors.white),
                        onPressed: () {
                          Navigator.pushNamed(context, '/Login');

                    }),
                  ],
                )
            ),

          ],


        )
    );
  }
}