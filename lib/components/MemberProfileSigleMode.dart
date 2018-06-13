import 'package:flutter/material.dart';
import 'package:mobile_app/components/selectIcon.dart';
import 'package:mobile_app/controller/Member.dart';
import 'package:mobile_app/screens/paymentsManager.dart';
import'package:mobile_app/otherComponents/Images.dart';
import 'package:mobile_app/controller/PaymentManagerDataloader.dart';


final TextEditingController _amount  = new TextEditingController();
final GlobalKey<FormState> _key = new GlobalKey<FormState>();
class MemberProfileSingleMode extends StatefulWidget {

  MemberProfileSingleMode({Key key , this.member = null  ,this.onRemoved,this.onClicked }) : super(key: key);
  @override
  _MemberProfileSigleMode createState() => new _MemberProfileSigleMode();

  // any value passed to the constructor has to declared in the below format
  final  Member member ;
  final ValueChanged<String> onRemoved;
  final ValueChanged<String> onClicked ;

}
class _MemberProfileSigleMode extends State<MemberProfileSingleMode>{


  double _progressVal ;
  Color _conColor = new Color.fromRGBO(181,190 , 204, 0.5);
  bool _selected = false;
  String _nic = '';
  List<String> periods = new List<String>();
  String _selPeriod = '';


  @override
  void initState() {
    periods = PaymentManagerDataLoader().getPeriods();
    _selPeriod = periods[0];
  }
  void onSubmitClicked(){
    double amt = double.parse(_amount.text) ;
//    bool status = PaymentManagerDataLoader().sendCollectionDetials(_nic, amt, _selPeriod);


  }
  void printclcked(){
    print('print');
  }

//  void _onIconSelected(bool val){ // state changed from the component is captures
//
//    setState(() {
//      _selected = val;
//      if(_selected){
//        widget.onClicked(_nic);
//        _conColor = new Color.fromRGBO(181,190 , 204, 1.0); // bg color is changed
//      }
//      else{
//        widget.onRemoved(_nic);
//        _conColor = new Color.fromRGBO(181,190 , 204, 0.5);// bg color is changed
//      }
//    });
//  }
  void dropDownValueChanged(String period){
    setState(() {
      _selPeriod = period;
    });
  }

  Widget build(BuildContext context){
    Member mem = widget.member;
    _progressVal = mem.paidLoanAmt/mem.loanAmt;
    _nic = mem.memNic;

    return new Container(

        margin: const EdgeInsets.symmetric(vertical: 10.0 , horizontal: 7.0),
        color: _conColor ,
        child: new Column(
          children: <Widget>[
            new Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,

              children: <Widget>[
                new Container(
                  padding: new EdgeInsets.symmetric(horizontal: 15.0),
                  child: Images().getImg('Images/profile.png', 40.0, 40.0),
                ) ,


                //Image.asset('assets/Images/profile.png'))
                // ,
                new Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,

                    children: <Widget>[
                      new Text(mem.memName,
                          style : new TextStyle( fontSize:20.0 , fontWeight: FontWeight.w500 )
                      ),
                      new Container(
                        margin: const EdgeInsets.symmetric(vertical: 3.0),
                        child: new SizedBox(
                            height: 20.0,
                            width: 150.0,
                            child: new LinearProgressIndicator(
                                value: _progressVal,
                                backgroundColor: new Color.fromRGBO(115, 219, 59, 0.4),
                                valueColor: new AlwaysStoppedAnimation<Color>(Colors.green))
                        ),
                      )

                    ]),
//                new Container(
//                  child: new SelectIcon(
//                    selected: _selected, // values are passed to  the this.selected in Select icon component
//                    onClicked:(bool val) {_onIconSelected(val);},// onclicked method is called in the slect Icon component
//                  ),
//                  alignment: Alignment.centerRight,
//                ) ,
              ],
            ),
             new Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[


                      new Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,

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
                          new Container(
                          margin: new EdgeInsets.symmetric(horizontal: 10.0),
                          child:new DropdownButton(
                              elevation: 3,
                              value: _selPeriod,
                              items: periods.map((String period){
                                return new DropdownMenuItem(child: new Text(period) , value: period,);
                              }).toList(),
                              onChanged: (String period){dropDownValueChanged(period);}
                          ) ,
                          ),



                        ],
                      ),


                      new Container(
                        margin: new EdgeInsets.symmetric(vertical: 10.0),
                        child: new Row(
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
                                'Add' ,
                                style: new TextStyle( fontWeight: FontWeight.w500 , fontSize: 20.0 , color: Colors.white ),
                              ),
                            ),
                          new FlatButton.icon(
                            icon: new Icon(Icons.print , size: 30.0, color: Colors.white,),
                            onPressed: (){printclcked();},
                            color: Colors.blue,
                            label: new Text('print' , style: new TextStyle(color: Colors.white , fontSize: 15.0),),
                            disabledColor: Colors.black12,

                          )
                          ],
                        ),
                      )






                    ]
                )

          ],




    ));

  }


}