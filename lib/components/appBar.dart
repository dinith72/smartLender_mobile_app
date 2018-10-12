import 'package:flutter/material.dart';
import 'dart:io';
class CustomAppBar {

  AppBar getAppBar(context , String title){
    return(
        new AppBar(
          backgroundColor: new Color.fromRGBO(204, 159, 14, 1.0), // color can be taken as r , g, b , opacity
          title: new Text(title ,
            textAlign: TextAlign.center ,
            style: new TextStyle(color: Colors.white , fontWeight: FontWeight.bold , fontSize: 25.0),
          ),
          actions: <Widget>[
            new Container(
//                color:  new Color.fromRGBO(232, 183, 25, 0.9),
                child: new Row(
                  children: <Widget>[
//                    new ImageIcon(
//                        new FileImage(new File("C:\Users\Dinith Jayabodhi\Downloads\profile_user.jpg"),{0.5})
//                    ),

//                    new Image.asset('/profile.png'),
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