import 'package:flutter/material.dart';

class MemberProfile {

  String _memname = 'Dinith' ;
  double _progressVal = 0.5;


  Widget getMemberProfile(){
    return new Container(
        child:new Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Text(_memname),
                new Container(
                  child: new SizedBox(
                      height: 20.0,
                      width: 200.0,
                      child: new LinearProgressIndicator(
                          value: _progressVal,
                          backgroundColor: new Color.fromRGBO(184, 234, 182, 0.2),
                          valueColor: new AlwaysStoppedAnimation<Color>(Colors.green))
                  ),                                    )

              ])
//
          ],
        )
    );

  }
}