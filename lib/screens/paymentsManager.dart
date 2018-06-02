import 'package:flutter/material.dart';
import 'package:mobile_app/main.dart';
import 'package:mobile_app/components/appBar.dart';
import 'package:mobile_app/components/CustomDrawer.dart';
import 'package:mobile_app/controller/PaymentManagerDataLoader.dart';
import 'package:mobile_app/components/memberProfile.dart';

class PaymentsManager extends StatefulWidget{
  @override
  _PaymentsManager createState() => new _PaymentsManager();
}

class _PaymentsManager extends State<PaymentsManager>{

  bool _collecting = true;
  String _textval = "Collections";
  Color _textColor = Colors.green;
  List <String> teams = new List<String>();
  String _teamVal ;
  void initState(){
    teams = PaymentManagerDataLoader().getTeams();
    _teamVal = teams[0];
  }


  switchPaymentOnClick(bool val){
    setState(() {  // this method should be implemented in stateful widget
      _collecting = val;
      if(_collecting){
        _textval = "Collecting";
        _textColor = Colors.green;
      }
      else {
        _textval = "Paying";
        _textColor = Colors.red;
      }
    });
  }
  teamOnChanged(String team){
    setState(() {
      _teamVal = team;
    });


  }
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new CustomAppBar().getAppBar(context,'Payments Manager'),
        drawer: new CustomDrawer().getDrawer(context),
        body: new Container(
            padding: new EdgeInsets.all(32.0),
            child: new Center(
                child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      new TextField(
                          decoration: new InputDecoration(
                              hintText: "Please enter center"
                          )),
                      new DropdownButton(
                          value: _teamVal,
                          items: teams.map((String val){
                            return new DropdownMenuItem(child: new Text(val), value: val );
                          }).toList(),
                          onChanged:(String val){teamOnChanged(val);}

                      ),
                      new Row(
                        children: <Widget>[
                          new Switch(
                              value: _collecting,
                              onChanged: (bool val){switchPaymentOnClick(val);
                              }
                          ),
                          new Text(_textval ,style: new TextStyle(color: _textColor , fontSize: 25.0 , fontWeight: FontWeight.bold),)
                        ],
                      ),
                      MemberProfile().getMemberProfile(),
                    ]
                )
            )
        )

    );
  }
}