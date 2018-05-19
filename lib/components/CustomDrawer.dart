import 'package:flutter/material.dart';

class CustomDrawer{

  Drawer getDrawer(context){
    return (
      new Drawer(

        elevation: 10.0,
        child: new Container(

          color: Colors.black,
          alignment: Alignment.topLeft,


          padding: new EdgeInsets.symmetric(vertical: 30.0,horizontal: 1.0),
          child: new Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
//                  adding some drawer tiles
              new FlatButton.icon(

                  onPressed: (){Navigator.pushNamed(context, '/Home');},
                  icon: new Icon(Icons.list , color: new Color.fromRGBO(204, 159, 14, 1.0), size: 35.0,),
                  label: new Text(
                    'Summary' ,
                    style: new TextStyle(fontSize:25.0 , color: Colors.white),
                  ),

              ),
              new FlatButton.icon(

                  onPressed: (){Navigator.pushNamed(context, '/Payments');},
                  icon: new Icon(Icons.payment , color: new Color.fromRGBO(204, 159, 14, 1.0), size: 35.0,),
                  label: new Text(
                    'Payments' ,
                    style: new TextStyle( fontSize: 25.0 ,color: Colors.white, )
                  )
              ),
//
            ],
          ),
        ),
      )
    );
  }
}