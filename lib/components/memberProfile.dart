import 'package:flutter/material.dart';
import 'package:mobile_app/components/selectIcon.dart';
class MemberProfile extends StatefulWidget { // as the stste is changed the parent class also should extend from stateful widger
  @override
  _MemberProfile createState() => new _MemberProfile();
}
class _MemberProfile extends State<MemberProfile>{

  String _memname = 'Dinith' ;
  double _progressVal = 0.5;
  Color _conColor = new Color.fromRGBO(181,190 , 204, 0.5);
  bool _selected = false;

  void _onIconSelected(bool val){ // state changed from the component is captures
      setState(() {
        _selected = val;
        if(val){
          _conColor = new Color.fromRGBO(181,190 , 204, 1.0); // bg color is changed
        }
        else{
          _conColor = new Color.fromRGBO(181,190 , 204, 0.5);// bg color is changed
      }
      });
  }

  Widget build(BuildContext context){
    return new Container(
        margin: const EdgeInsets.symmetric(vertical: 10.0 , horizontal: 10.0),
        color: _conColor ,
        child:new Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,

          children: <Widget>[
            new Container(
              child: new ImageIcon( new AssetImage('Images/new.png') , size:30.0 ) ,
              margin: const EdgeInsets.symmetric(horizontal: 10.0 ,vertical: 5.0),
              alignment: Alignment.center,
            ) ,

        //Image.asset('assets/Images/profile.png'))
          // ,
            new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Text(_memname,
                      style : new TextStyle( fontSize:20.0 , fontWeight: FontWeight.w500 )
                  ),
                  new Container(
                    margin: const EdgeInsets.symmetric(vertical: 3.0),
                    child: new SizedBox(
                        height: 20.0,
                        width: 150.0,
                        child: new LinearProgressIndicator(
                            value: _progressVal,
                            backgroundColor: new Color.fromRGBO(184, 234, 182, 0.2),
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