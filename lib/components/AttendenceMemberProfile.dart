import 'package:flutter/material.dart';
import 'package:mobile_app/components/selectIcon.dart';
import 'package:mobile_app/controller/Member.dart';
import 'package:mobile_app/otherComponents/Images.dart';
import 'package:mobile_app/screens/paymentsManager.dart';

class AttMemberProfile extends StatefulWidget {

  AttMemberProfile({Key key , this.member = null  ,this.onRemoved,this.onClicked }) : super(key: key);
  @override
  _AttMemberProfile createState() => new _AttMemberProfile();

  // any value passed to the constructor has to declared in the below format
  final  Member member ;
  final ValueChanged<String> onRemoved;
  final ValueChanged<String> onClicked ;

}
class _AttMemberProfile extends State<AttMemberProfile> {

  List<int> attDetails = [0 , 1 , 1 , 0 ];
  List<Widget> attIcon = new List<Widget>(); // creating list which contain widgets

  Color _conColor = new Color.fromRGBO(147, 214, 202, 0.5);
  bool _selected = false;
  String _nic = '';


  @override
  void initState() {
  // creating set of icons using a for loop
    for(int num in attDetails){
      Icon icn;
      if(num == 1){
        icn = new Icon( Icons.check_circle_outline , color: Colors.green, );
      }
      else {
        icn = new Icon(Icons.clear , color: Colors.red, );
      }
      attIcon.add(icn); // adding all the icons to above mentioned list

    }
  }

  void _onIconSelected(bool val) {
    // state changed from the component is captures

    setState(() {
      _selected = val;
      if (_selected) {
        widget.onClicked(_nic);
        _conColor =
        new Color.fromRGBO(129, 226, 209, 1.0); // bg color is changed
      }
      else {
        widget.onRemoved(_nic);
        _conColor =
        new Color.fromRGBO(147, 214, 202, 0.5); // bg color is changed
      }
    });
  }


  Widget build(BuildContext context) {
    Member mem = widget.member;
    _nic = mem.memNic;

    return new Container(
        padding: new EdgeInsets.symmetric(vertical: 10.0 , horizontal: 5.0),
        margin: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 7.0),
        color: _conColor,
        child: new Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,

          children: <Widget>[
//            new Container(
//              child: new ImageIcon(
//                  new ExactAssetImage('Images/profile.png', scale: 0.75),
////                  new AssetImage('Images/new.png') ,
//                  size: 55.0),
//              margin: const EdgeInsets.symmetric(
//                  horizontal: 5.0, vertical: 5.0),
//              alignment: Alignment.center,
//            ),
          Images().getImg('Images/profile.png', 50.0, 50.0)   ,

            //Image.asset('assets/Images/profile.png'))
            // ,
            new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,

                children: <Widget>[
                  new Text(mem.memName,
                      style: new TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.w500)
                  ),
                  new Row(
                  children: attIcon, // adding them to a row , similaryly an be added to another component

    ),
//
                ]),
            new Container(
              child: new SelectIcon(
                selected: _selected,
                // values are passed to  the this.selected in Select icon component
                onClicked: (bool val) {
                  _onIconSelected(val);
                }, // onclicked method is called in the slect Icon component
              ),
              alignment: Alignment.centerRight,
            ),
          ],
        )
    );
  }
}