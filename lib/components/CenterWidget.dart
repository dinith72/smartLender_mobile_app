import 'package:flutter/material.dart';
import 'package:mobile_app/modelClasses/CenterInfo.dart';


class CenterWidget extends StatefulWidget{
   CenterWidget({Key key, this.centerInfo = null}) : super(key: key);
  
  @override
  _CenterWidget createState() => new _CenterWidget();
final CenterInfo centerInfo ;
}

class _CenterWidget extends State<CenterWidget>{
  String _name = '';
  double _payements = 0.0;
  double _collections = 0.0 ;
  double _attendence = 0.0;
  @override
  void initState() {
      if(widget.centerInfo.name != ""){
        _name = widget.centerInfo.name;
      }
      if(widget.centerInfo.payments != null){
        _payements = widget.centerInfo.payments;
      }
      if(widget.centerInfo.collections != null){
        _collections = widget.centerInfo.collections;
      }
      if(widget.centerInfo.attendemce != null){
        _attendence = widget.centerInfo.attendemce;
      }
  }


  Widget build(BuildContext context) {
    return new Container(


        child:   new Card(
                color: new Color.fromRGBO(154, 237, 237, 1.0),
                child: new Column(
                    children: <Widget>[
                          new Text(_name , style: new TextStyle(fontSize: 30.0 , fontWeight: FontWeight.w500 ),),
                          new Row(
                            children: <Widget>[
                              new Icon(Icons.arrow_drop_up , color: Colors.green, size: 50.0, ),
                               new Text(_collections.toString() , style: new TextStyle(fontWeight: FontWeight.w700 , fontSize: 25.0), )
                            ],
                          ),
                          new Row(
                            children: <Widget>[
                              new Icon(Icons.arrow_drop_down , color: Colors.red , size: 50.0,),
                              new Text(_payements.toString(),style: new TextStyle(fontWeight: FontWeight.w700 , fontSize: 25.0),)
                            ],
                          ),
                          new Row(
                            children: <Widget>[
                              new Icon(Icons.people , color: Colors.black54, size: 50.0,),
                              new Text(_attendence.toString(),style: new TextStyle(fontWeight: FontWeight.w700 , fontSize: 25.0),)
                            ],
                          )
                    ]
                )

        )
    );
  }

  
}