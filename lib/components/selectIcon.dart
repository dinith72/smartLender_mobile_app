// this icon changes the icon picture and the state when selected

import 'package:flutter/material.dart';

class SelectIcon extends StatefulWidget{ // should extend from stateful widget
  SelectIcon({Key key , this.selected: false,  this.onClicked }) : super(key: key);
//  this.selected - the value which changes with the user action
//  this.onclicked() - the funcion which capture the user action

  final bool selected ;
  final ValueChanged<bool> onClicked ;
  // the above two trigger the activity of the parent component state change

  @override
  _SelectIcon createState() => new _SelectIcon();
}
class _SelectIcon extends State<SelectIcon>{
  bool _tapped = false; // used to create internal state updates ( change the icon when tap )
  var _icon = Icons.add;

  void _handleTap(){
    widget.onClicked(!widget.selected);
    setState(() {
      _tapped = !_tapped; // toggle the value of tapped
      if(_tapped){
        _icon = Icons.done; // when a tap is made the icon is changed
      }
      else{
        _icon = Icons.add;
      }
    });
  }

  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: _handleTap,
      child: new Container(
        child: new Center(
          child: new Icon( _icon , size: 50.0,)
        ),
//

      ),
    );
  }

}