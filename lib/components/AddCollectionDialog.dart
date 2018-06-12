import 'package:flutter/material.dart';
import 'package:mobile_app/controller/PaymentManagerDataloader.dart';
import 'package:date_format/date_format.dart';
import 'dart:async';


final TextEditingController _amount  = new TextEditingController();
final GlobalKey<FormState> _key = new GlobalKey<FormState>();


class AddCollectionDialog extends StatefulWidget {
  AddCollectionDialog({Key key , this.nic = null}) : super(key: key);

  final List<String> nic;

  @override
  _AddCollectionDialog createState() => new _AddCollectionDialog();
}

class _AddCollectionDialog extends State<AddCollectionDialog>{
  List<String> periods = new List<String>();
  String _selPeriod = '';
  DateTime _date= null;


  @override
  void initState() {
    periods = PaymentManagerDataLoader().getPeriods();
    _selPeriod = periods[0];
    _date = DateTime.now();
  }

  void dropDownValueChanged(String period){
    setState(() {
      _selPeriod = period;
    });
  }
  Future<Null> selectDate(BuildContext context) async {
    final DateTime cal = await showDatePicker(
      context: context,
      initialDate: _date, // initial date
      firstDate: new DateTime(2014), // earliest date you can pick
      lastDate: new DateTime(2030), // latest date you can pick
    );
    if (cal != null && cal != _date)
      setState(() {
        _date = cal; // updating the state

      });
  }


  void onSubmitClicked(){
    double amt = double.parse(_amount.text) ;
    bool status = PaymentManagerDataLoader().sendCollectionDetials(widget.nic, amt, _selPeriod);

    if(status) {
      Navigator.pushNamed(context, '/Payments');
    }
  }



  @override
  Widget build(BuildContext context) {
    return new AlertDialog(
      content: new Container(
        child:

        new Form( // creates new form
            key: _key,
            child: new Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[


                  new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Flexible(
                        child: new TextFormField(
                          controller: _amount ,
                          decoration: new InputDecoration(labelText: "enter amount" ),
                          validator: (String text){ // we can set the validation on the text field itself
                            // checks whether only nemeric is entered
                            try {
                              var val = double.parse(text);
                            }on FormatException{
                              return 'Incorrect input';
                            }
                          },
                        ),
                      ) ,

                      new Text(
                        formatDate(_date,  [M, '-', d]) , // the date is didplyed in text field
                        style: new TextStyle( fontSize: 20.0 , color: Colors.blue),

                      ),
                      new IconButton( // when this iscon is clicked future is excuted and date selection dialog appeas
                        icon: new Icon(Icons.calendar_today),
                        onPressed: (){selectDate(context);},
                        color: Colors.blue,
                      )
                    ],
                  ),

                      new DropdownButton(
                          elevation: 3,
                          value: _selPeriod,
                          items: periods.map((String period){
                            return new DropdownMenuItem(child: new Text(period) , value: period,);
                          }).toList(),
                          onChanged: (String period){dropDownValueChanged(period);}
                          ),

                   new Row(
                     mainAxisAlignment:  MainAxisAlignment.spaceEvenly,
                     children: <Widget>[
                       new RaisedButton( // this is the submit button
                           onPressed: (){
                             if(_key.currentState.validate()){  // validation is checked here
                               onSubmitClicked();
                             }
                           },
                           elevation: 4.0,
                           color: Colors.green,
                           child: new Text(
                             'Submit' ,
                             style: new TextStyle( fontWeight: FontWeight.w500 , fontSize: 20.0 , color: Colors.white ),
                           ),
                       ),
                       new FlatButton.icon(
                         icon: new Icon(Icons.print , size: 30.0, color: Colors.white,),
                         onPressed: (){selectDate(context);},
                         color: Colors.blue,
                         label: new Text('print' , style: new TextStyle(color: Colors.white , fontSize: 15.0),),
                         disabledColor: Colors.black12,

                       )
                     ],
                   )





                ]
            )
        ),
      ),
    );
  }


}