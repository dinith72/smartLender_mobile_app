import 'package:flutter/material.dart';
class alertWindow {

    Widget WarningWindow(context){
      return(
        new AlertDialog(

            content: new Container(

              color: new Color.fromRGBO(244, 66, 125, 0.2),

              child: new Column(
                mainAxisSize: MainAxisSize.min,
//              crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[

                  new Text('incorrect password'), // text
                  new RaisedButton(onPressed:(){Navigator.pop(context);}  , child: new Text('Ok'),), // on click button to close when it is pressed
                ],
              )

            ),


            title: new Container(
              color: new Color.fromRGBO(244, 66, 125, 0.6),
              child: new Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  new Icon(Icons.warning),
                  new Text('ALERT', textAlign: TextAlign.justify,),

                ],

              ),



////

            ),
            titlePadding: new EdgeInsets.symmetric(vertical: 5.0 , horizontal:10.0 ),

        )
      );
}

}