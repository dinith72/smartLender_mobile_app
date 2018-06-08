import 'package:flutter/material.dart';
import 'dart:async';
import 'package:mobile_app/controller/AttendenceController.dart';
//import 'package:flutter/D';



class MarkAttendenceDialog extends StatefulWidget {
  MarkAttendenceDialog({Key key , this.nic = null}) : super(key: key);

  final List<String> nic;

  @override
  _MarkAttendenceDialog createState() => new _MarkAttendenceDialog();
}

class _MarkAttendenceDialog extends State<MarkAttendenceDialog>{
  List<String> attendTypes ;
  String _type = '';
  DateTime _date = new DateTime.now();





  @override
  void initState() {

  }

  Future<Null> selectDate(BuildContext context) async {
     final DateTime cal = await showDatePicker(
        context: context,
        initialDate: _date,
        firstDate: new DateTime(2014),
        lastDate: new DateTime(2030),
    );
     if (cal != null && cal != _date)
       setState(() {
         _date = cal;

       });
  }



  void dropDownValueChanged(String val){
    setState(() {
      _type = val;
    });
  }

  void onSubmitClicked(){
      int attStatus = 0 ;
      if(_type.contains("Present")){
        attStatus = 1;
      }else if (_type.contains('Absent')){
        attStatus = 5;
      }


    bool status = Attendencecontroller().markAttendence(widget.nic, _date, attStatus);

//    if(status) {
//      Navigator.pushNamed(context, '/Payments');
//    }
    for( String s in widget.nic){
      print(s);
    }
    print (_type);
  }



  @override
  Widget build(BuildContext context) {
//    print('test');
    attendTypes =  ['Present' , 'Absent' , 'Excused'];
    _type = attendTypes[0];
    return new AlertDialog(
        content: new Container(
            child: new Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                new DropdownButton(
                    elevation: 3,
                    value: _type,
                    items: attendTypes.map((String val){
                      return new DropdownMenuItem(child: new Text(val) , value: val,);
                    }).toList(),
                    onChanged: (String period){dropDownValueChanged(period);}),

                new Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                     new Text(
                        _date.toString().substring(0,10) ,
                       style: new TextStyle( fontSize: 20.0 , color: Colors.blue),),
                      new IconButton(
                          icon: new Icon(Icons.calendar_today),
                          onPressed: (){selectDate(context);},
                          color: Colors.blue,
                      )
                  ],
                ),

                new RaisedButton( // this is the submit button
                    onPressed: (){onSubmitClicked();},
                    elevation: 4.0,
                    color: Colors.green,
                    child: new Text(
                      'Add' ,
                      style: new TextStyle( fontWeight: FontWeight.w500 , fontSize: 20.0 , color: Colors.white ),
                    )
                )
              ],
            )




        )
    );

  }


}