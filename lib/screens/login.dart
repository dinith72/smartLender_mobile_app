import 'package:flutter/material.dart';
import 'package:mobile_app/controller/LoginController.dart';
import 'package:mobile_app/databaseConn.dart';
import 'package:mobile_app/main.dart';

class Login extends StatefulWidget{
  @override
  _Login createState() => new _Login();
}

class _Login extends State<Login>{
  static final TextEditingController _user  = new TextEditingController();
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
                          onPressed: (){
                            bool result = new loginController().validateUser(_user.text,_pw.text);
                            AlertDialog alert;
                            if(result){
                              Navigator.pushNamed(context, '/Home');
                            }
                            else {
                               alert = new AlertDialog( // creating the alert dialog
                                  content: new Column( // setting the content
                                    children: <Widget>[

                                      new Text('incorrect password'), // text
                                      new RaisedButton(onPressed:(){Navigator.pop(context);}  , child: new Text('Ok'),), // on click button to close when it is pressed
                                    ],
                                  ),

                                  title: new Icon(Icons.warning) // title of the alert button is set an icon
                              );
                              Navigator.pushNamed(context, '/Login');

                            }
                            if(alert != null){
                              showDialog(context: context, child: alert);
                            }

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