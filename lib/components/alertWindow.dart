import 'package:flutter/material.dart';
import 'package:mobile_app/controller/Member.dart';
import 'package:mobile_app/otherComponents/Images.dart';
import 'package:mobile_app/screens/MemberInfo.dart';



class alertWindow {
  List <Member>  mem ;

  Widget WarningWindow(context , String message){
    return(
        new AlertDialog(

          content: new Container(

              color: new Color.fromRGBO(244, 66, 125, 0.2),

              child: new Column(
                mainAxisSize: MainAxisSize.min,
//              crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[

                  new Text(message), // text
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



  Widget selectionDialog(context, List<Member> memList){

    return new AlertDialog(
        content: new ListView.builder( // create the list view

            shrinkWrap: true, // essential code , infinete hight is shown without this code
            scrollDirection: Axis.vertical,
            itemCount: memList.length,
            itemBuilder: ( BuildContext context , int index ) {

              return new GestureDetector(

                  child: new  Card(
                      margin: new EdgeInsets.symmetric(vertical: 15.0 , horizontal: 2.0),
                      elevation: 2.0,


                      child: new Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Images().getImg('Images/profile.png', 45.0, 45.0),

                          new Column(

                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[


//
                              new Container(
                                  margin: new EdgeInsets.symmetric(vertical: 5.0 , horizontal: 3.0),
                                  child: new Text(
                                    memList[index].memName ,
                                    style: new TextStyle(fontWeight: FontWeight.w700 , fontSize: 15.0 ),
                                  )
                              ),
                              new Container(
                                margin: new EdgeInsets.symmetric(vertical: 5.0 , horizontal: 3.0),
                                child: new Text(
                                    memList[index].memNic ,
                                    style: new TextStyle(fontWeight: FontWeight.w400 , fontSize: 15.0 )
                                ),
                              )

                            ],
                          ) ,
                        ],
                      )
                  )
              );
            }
        )
    );
  }

}