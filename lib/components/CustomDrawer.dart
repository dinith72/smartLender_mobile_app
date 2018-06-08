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
//            mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,

              children: <Widget>[

                new Container(
                  child: new FlatButton.icon(

                    onPressed: (){Navigator.pushNamed(context, '/Home');},
                    icon: new Icon(Icons.list , color: new Color.fromRGBO(204, 159, 14, 1.0), size: 35.0),
                    label: new Text(
                      'Home' ,
                      style: new TextStyle(fontSize:25.0 , color: Colors.white),
                    ),
                  ),
                  margin: const EdgeInsets.symmetric(vertical: 15.0),
                ),

                new Container(
                    child:new FlatButton.icon(

                      onPressed: (){Navigator.pushNamed(context, '/MemberInfo');},
                      icon: new Icon(Icons.info , color: new Color.fromRGBO(204, 159, 14, 1.0), size: 35.0,),
                      label: new Text(
                          'Member Info' ,
                          style: new TextStyle( fontSize: 25.0 ,color: Colors.white, )
                      ) ,
                    ),
                  margin: const EdgeInsets.symmetric(vertical: 15.0),
                ),
                new Container(
                  child:  new FlatButton.icon(

                      onPressed: (){Navigator.pushNamed(context, '/Payments');},
                      icon: new Icon(Icons.payment , color: new Color.fromRGBO(204, 159, 14, 1.0), size: 35.0,),
                      label: new Text(
                          'Payments' ,
                          style: new TextStyle( fontSize: 25.0 ,color: Colors.white, )
                      )
                  ),
                  margin: const EdgeInsets.symmetric(vertical: 15.0),

                ),
                new Container(
                  child:  new FlatButton.icon(

                      onPressed: (){Navigator.pushNamed(context, '/Attendence');},
                      icon: new Icon(Icons.people , color: new Color.fromRGBO(204, 159, 14, 1.0), size: 35.0,),
                      label: new Text(
                          'Attendence' ,
                          style: new TextStyle( fontSize: 25.0 ,color: Colors.white, )
                      )
                  ),
                  margin: const EdgeInsets.symmetric(vertical: 15.0),

                ),


//
              ],
            ),
          ),
        )
    );
  }
}