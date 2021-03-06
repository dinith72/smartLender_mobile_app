import 'package:flutter/material.dart';
import 'package:mobile_app/components/selectIcon.dart';
import 'package:mobile_app/controller/Member.dart';
import 'package:mobile_app/screens/paymentsManager.dart';
import'package:mobile_app/otherComponents/Images.dart';

class MemberProfile extends StatefulWidget {

  MemberProfile({Key key , this.member = null  ,this.onRemoved,this.onClicked }) : super(key: key);
  @override
  _MemberProfile createState() => new _MemberProfile();

  // any value passed to the constructor has to declared in the below format
  final  Member member ;
  final ValueChanged<String> onRemoved;
  final ValueChanged<String> onClicked ;

}
class _MemberProfile extends State<MemberProfile>{


  double _progressVal ;
  Color _conColor = new Color.fromRGBO(147, 214, 202, 0.5);
  bool _selected = false;
  String _nic = '';




  void _onIconSelected(bool val){ // state changed from the component is captures

    setState(() {
      _selected = val;
      if(_selected){
        widget.onClicked(_nic);
        _conColor = new Color.fromRGBO(129, 226, 209, 1.0); // bg color is changed
      }
      else{
        widget.onRemoved(_nic);
        _conColor = new Color.fromRGBO(147, 214, 202, 0.5);// bg color is changed
      }
    });
  }

  Widget build(BuildContext context){
    Member mem = widget.member;
    _progressVal = mem.paidLoanAmt/mem.loanAmt;
    _nic = mem.memNic;

    return new Container(
        padding: new EdgeInsets.symmetric(vertical: 10.0),
        margin: const EdgeInsets.symmetric(vertical: 5.0 , horizontal: 7.0),
        color: _conColor ,
        child:new Row(
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
            new Container(
              child: new SelectIcon(
                selected: _selected, // values are passed to  the this.selected in Select icon component
                onClicked:(bool val) {_onIconSelected(val);},// onclicked method is called in the slect Icon component
              ),
              alignment: Alignment.centerRight,
            ) ,
          ],
        )
    );

  }


}