import 'package:flutter/material.dart';
import 'package:mobile_app/controller/LoginController.dart';
import 'package:mobile_app/components/alertWindow.dart';
import 'package:mobile_app/main.dart';
import 'dart:async';

class Login extends StatefulWidget{
  @override
  _Login createState() => new _Login();
}

class _Login extends State<Login>{
  static final TextEditingController _user  = new TextEditingController(); // the controller is declared as in here
  static final TextEditingController _pw = new TextEditingController();

  bool _switchVal = false;


  Widget build(BuildContext context) {
    return new Scaffold(

        body: new Container(
            padding: new EdgeInsets.all(32.0),
            child: new Center(
                child: new Column(

                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      new Text('SmartLender') ,
                      new TextField(
                        controller: _user,
                        decoration: new InputDecoration(hintText: 'enter username' , labelText : 'username',),

                        autocorrect: true,

                      ),
                      new TextField( controller: _pw,decoration: new InputDecoration(hintText: 'enter password'), obscureText: true),
                      new Container(
                        margin: const EdgeInsets.symmetric(vertical: 15.0),
                        child: new RaisedButton(
                          onPressed: () {
                            new loginController().getLoginInfo(_pw.text,_user.text)
//                            await Future.wait()
                            .then((bool value){
                              print(value);
                              AlertDialog alert;
                              if(value){
                                Navigator.pushNamed(context, '/Home');
                              }
                              else {
                                alert = new alertWindow().WarningWindow(context,"incorrect password");
                                Navigator.pushNamed(context, '/Login');

                              }
                              if(alert != null){
                                showDialog(context: context, child: alert);
                              }
                            });




                          },
                          child: new Text('login'),


                        ),
                      )



                    ]
                )
            )
        )
    );
  }
}