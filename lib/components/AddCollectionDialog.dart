import 'package:flutter/material.dart';
import 'package:mobile_app/controller/PaymentManagerDataloader.dart';


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


  @override
  void initState() {
    periods = PaymentManagerDataLoader().getPeriods();
    _selPeriod = periods[0];
  }

  void dropDownValueChanged(String period){
    setState(() {
      _selPeriod = period;
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

        new Form(
            key: _key,
            child: new Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new TextFormField(
                    controller: _amount ,
                    decoration: new InputDecoration(labelText: "enter the amount here" ),
                    validator: (String text){
                      try {
                        var val = double.parse(text);
                      }on FormatException{
                        return 'Incorrect input';
                      }
                    },
                  ),
                  new DropdownButton(
                      elevation: 3,
                      value: _selPeriod,
                      items: periods.map((String period){
                        return new DropdownMenuItem(child: new Text(period) , value: period,);
                      }).toList(),
                      onChanged: (String period){dropDownValueChanged(period);}),

                  new RaisedButton(
                      onPressed: (){
                        if(_key.currentState.validate()){
                          onSubmitClicked();
                        }
                      },
                      elevation: 4.0,
                      color: Colors.green,
                      child: new Text(
                        'Submit' ,
                        style: new TextStyle( fontWeight: FontWeight.w500 , fontSize: 20.0 , color: Colors.white ),
                      )
                  )
                ]
            )
        ),
      ),
    );
  }


}