import 'package:flutter/material.dart';
import 'package:mobile_app/main.dart';
import 'package:mobile_app/components/appBar.dart';
import 'package:mobile_app/components/CustomDrawer.dart';
import 'package:mobile_app/controller/PaymentManagerDataloader.dart';
import 'package:mobile_app/components/memberProfile.dart';
import 'package:mobile_app/components/AddCollectionDialog.dart';
import 'package:mobile_app/controller/Member.dart';
import 'package:mobile_app/components/MemberProfileSigleMode.dart';


class PaymentsManager extends StatefulWidget{
  @override
  _PaymentsManager createState() => new _PaymentsManager();



}

class _PaymentsManager extends State<PaymentsManager>{

  List<String> selMem = new List<String>(); // stres all the nic numbers of the select member profiles

  bool _collecting = true;
  String _textval = "Collections";
  Color _textColor = Colors.green;
  List <String> teams = new List<String>();
  List <Member> memList = new List<Member>();
  String _teamVal ;
  bool _batchMode = true;


  void initState(){
    teams = PaymentManagerDataLoader().getTeams();
    memList = PaymentManagerDataLoader().getMembers();
    _teamVal = teams[0];

  }

  void batchModeToggle(bool value){
    setState(() {
      _batchMode = value;
    });
  }
  Widget addButtonPressed(){

    Widget alert = new  AddCollectionDialog( nic: selMem,);
    showDialog(context: context , child: alert);
    return alert;

  }



  void memberSelected(String nic){
    selMem.add(nic);
  }

  void memberRemoved(String nic){
    selMem.remove(nic);
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
          appBar: new CustomAppBar().getAppBar(context, 'Payments Manager'),
          drawer: new CustomDrawer().getDrawer(context),
          // the following template must be followed to get scrollabel windoe
          body: new CustomScrollView( // the scroallable effect are applied to body
            shrinkWrap: true,
            // essential code , get infine hight error if not used
            slivers: <Widget>[
              new SliverPadding(
                padding: const EdgeInsets.all(0.0),
                sliver: new SliverList(
                  delegate: new SliverChildListDelegate(
                    <Widget>[
                      _getComponents()

                    ],
                  ),
                ),
              ),
            ],
          )
      );


  }

  Container _getComponents(){
    return new Container(
        padding: new EdgeInsets.all(32.0),
        child: new Center(
            child: new Column(

                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.max,

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
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      new Container(
                          child :new Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              new Switch(
                                  value: _collecting,
                                  onChanged: (bool val){switchPaymentOnClick(val);
                                  }
                              ),
                              new Text(_textval ,style: new TextStyle(color: _textColor , fontSize: 20.0 , fontWeight: FontWeight.bold),),
                            ],
                          )
                      ),




                      new Container(
                          padding: const EdgeInsets.symmetric(horizontal: 5.0),
                          alignment: Alignment.centerRight,
                          child:new RaisedButton(
                            onPressed:(){addButtonPressed();}, // for the button to become active method should be declared
                            color: new Color.fromRGBO(204, 159, 14, 1.0),
                            elevation: 4.0, // gives 3d effect to button

                            child: new Text(
                              "Add" ,
                              style: new TextStyle( fontWeight: FontWeight.w700, color: Colors.white , fontSize: 20.0)
                              ,),


                          )
                      )
                    
                    

                    ],

                  ),
                  new  SwitchListTile(
                        value: _batchMode,
                        onChanged: (bool value){batchModeToggle(value);},
                        title: new Text('Batch mode'),
                      ),

                  getMemberCard(),
//                  new ListView.builder( // create the list view
//
//                      shrinkWrap: true, // essential code , infinete hight is shown without this code
//                      scrollDirection: Axis.vertical,
//                      itemCount: memList.length,
//                      itemBuilder: ( BuildContext context , int index ) {
//                        return new Card(
//                          child:  new MemberProfile( // get items of member profile ( components ) recursively
//                            member: memList[index], //
//
//
//                            onClicked: (String nic){memberSelected(nic);},
//                            onRemoved: (String nic){memberRemoved(nic);},
//                          ),
//
//
//                        );
////                          getMemberCard(index);
//                      }
//                  )

                ]
            )
        )
    );
  }
  Widget getMemberCard(){
    if(_batchMode){
      return new ListView.builder( // create the list view

          shrinkWrap: true, // essential code , infinete hight is shown without this code
          scrollDirection: Axis.vertical,
          itemCount: memList.length,
          itemBuilder: ( BuildContext context , int index ) {
            return new Card(
              child:  new MemberProfile( // get items of member profile ( components ) recursively
                member: memList[index], //


                onClicked: (String nic){memberSelected(nic);},
                onRemoved: (String nic){memberRemoved(nic);},
              ),


            );

          }
      );
    }
      else{
      return new ListView.builder( // create the list view

          shrinkWrap: true, // essential code , infinete hight is shown without this code
          scrollDirection: Axis.vertical,
          itemCount: memList.length,
          itemBuilder: ( BuildContext context , int index ) {
            return new Card(
              child:  new MemberProfileSingleMode(
                member: memList[index],
              )


            );

          }
      );

    }

  }

}