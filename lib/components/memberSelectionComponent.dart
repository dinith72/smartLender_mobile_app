import 'package:flutter/material.dart';
import 'package:mobile_app/controller/Member.dart';
import 'package:mobile_app/otherComponents/Images.dart';
//import 'package:app/main.dart';

class Selectioncomponent extends StatefulWidget{
  @override

  Selectioncomponent({Key key ,this.memList = null ,this.onClicked }) : super(key: key);

  final List<Member> memList ;
  final ValueChanged<String> onClicked ;
  _SelectionComponent createState() => new _SelectionComponent();
}

class _SelectionComponent extends State<Selectioncomponent>{

  bool _switchVal = false;

  memberSelected(String nic){
    setState(() {
      widget.onClicked(nic);
    });
  }
  Widget build(BuildContext context) {
    return new Scaffold(

        body: new Container(
            padding: new EdgeInsets.all(32.0),
            child:  new AlertDialog(
        content: new ListView.builder( // create the list view

            shrinkWrap: true, // essential code , infinete hight is shown without this code
            scrollDirection: Axis.vertical,
            itemCount: widget.memList.length,
            itemBuilder: ( BuildContext context , int index ) {

              return new GestureDetector(
                  onTap: (){memberSelected(widget.memList[index].memNic);},
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
                                   widget.memList[index].memName ,
                                    style: new TextStyle(fontWeight: FontWeight.w700 , fontSize: 15.0 ),
                                  )
                              ),
                              new Container(
                                margin: new EdgeInsets.symmetric(vertical: 5.0 , horizontal: 3.0),
                                child: new Text(
                                    widget.memList[index].memNic ,
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
    )
            )
        )
    ;
  }
}