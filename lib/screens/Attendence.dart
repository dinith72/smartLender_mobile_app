import 'package:flutter/material.dart';
import 'package:material_search/material_search.dart';
import  'package:mobile_app/components/appBar.dart';
import 'package:mobile_app/components/CustomDrawer.dart';
import 'package:mobile_app/controller/Member.dart';
import 'package:mobile_app/controller/PaymentManagerDataloader.dart';
import 'package:mobile_app/components/AttendenceMemberProfile.dart';
import 'package:mobile_app/components/MarkAttendenceDialog.dart';
import 'package:mobile_app/controller/AttendenceController.dart';

class Attendence extends StatefulWidget{
  @override
  _Attendence createState() => new _Attendence();
}

class _Attendence extends State<Attendence>{
  List<String> selMem = new List<String>(); // stres all the nic numbers of the select member profiles
  Map<String , String> _centersMap = new Map();
  Map<String , String> _teamsMap = new Map();
  Map<String, String> _memMap  = new Map();
  bool _collecting = true;
  String _textval = "Collections";
  Color _textColor = Colors.green;
  List <String> teams = new List<String>();
  List <Member> memList = new List<Member>();
  String _teamVal ;
  String _centerId = '';

  final _formKey = new GlobalKey<FormState>();
  List<String> _centerList = new List<String>();

  void initState() {
    teams = PaymentManagerDataLoader().getTeams();
//    memList = PaymentManagerDataLoader().getMembers();
    _teamVal = teams[0];
    Attendencecontroller().getCenterNamesAsync()
    .then((Map<String,String> results) {
//      _centerList = results;
        _centersMap = results;
        for(var id in results.keys){
          _centerList.add(results[id]);
        }
    });
//    _centersMap = Attendencecontroller().
//    print("init finished");

  }
  void centerSearchSelected(dynamic name){
//    _centerId = Attendencecontroller().getCenterId(name.toString());
    var cenId = _centersMap.keys.firstWhere(
            (k) => _centersMap[k] == name.toString(), orElse: () => null);
    print(cenId);
    Attendencecontroller().getTeamsAsync(cenId.toString())
    .then((Map<String,String> results){
      setState(() {
//        teams.clear();
        _teamsMap = results;
        for(var id in results.keys){
          teams.add(results[id]);
        }
      });


    });
  }
  Widget addButtonPressed(){

    Widget alert = new  MarkAttendenceDialog(nic: selMem,);
    showDialog(context: context , child: alert);
//    for(String s in selMem){
//      print(s);
//    }
    return null;

  }

  void memberSelected(String nic){
    print(nic);
//    selMem.add(nic);
    var tmemId = _memMap.keys.firstWhere(
            (k) => _memMap[k] == nic, orElse: () => null);
//    print(tmemId);
    selMem.add(tmemId);
  }

  void memberRemoved(String nic){
    var tmemId = _memMap.keys.firstWhere(
            (k) => _memMap[k] == nic, orElse: () => null);
    print(tmemId);
//    selMem.add(tmemId);
    selMem.remove(tmemId);
  }


  void teamOnChanged(String team){
    var teamId = _teamsMap.keys.firstWhere(
            (k) => _teamsMap[k] == team.toString(), orElse: () => null);
    print(teamId);
    setState(() {
      _teamVal = team;
      Attendencecontroller().getMembersAsync(teamId)
      .then((Map<String,Member> results) {
        setState(() {
//        teams.clear();
//          _teamsMap = results;
          for (var id in results.keys) {
            memList.add(results[id]);
//           print(id);
            _memMap.putIfAbsent(id, () => results[id].memNic);
          }
        });

      });
    });
  }


  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new CustomAppBar().getAppBar(context,'Attendence'),
        drawer: new CustomDrawer().getDrawer(context),
        body: new CustomScrollView(
          shrinkWrap: true,
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
//                  new TextField(
//                      decoration: new InputDecoration(
//                          hintText: "Please enter center"
//                      )),
                  new Form(
                      child: new Column(
                        children: <Widget>[
                          new MaterialSearchInput<String>(
                              placeholder: 'Center Name',


                              // retruns the list of items to the search dialog
                              results: _centerList.map((String v) {

                                return MaterialSearchResult<String>(
                                  icon: Icons.business,
                                  value: v,
                                  text: v,
                                );
                              }).toList(),
                              // creates a filter according to the criteria enteredd
                              filter: (dynamic value, String criteria) {
                                return value.toLowerCase().trim()
                                    .contains(new RegExp(r'' + criteria.toLowerCase().trim() + ''));
                              },
                              onSelect: (dynamic value) {
                                  centerSearchSelected(value);
                              },

                              validator: (dynamic value) => value == null ? 'Required field' : null,
                               formatter: (dynamic v) => v,
                              ),
                        ],
                      )
                  ) ,
                  new DropdownButton(
                      value: _teamVal,
                      items: teams.map((String val){
                        return new DropdownMenuItem(child: new Text(val), value: val );
                      }).toList(),
                      onChanged:(String val){teamOnChanged(val);}

                  ),
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[

                      new Container(
                          padding: const EdgeInsets.symmetric(horizontal: 5.0),
                          alignment: Alignment.centerRight,
                          child:new RaisedButton(
                            onPressed:(){addButtonPressed();}, // for the button to become active method should be declared
                            color: new Color.fromRGBO(204, 159, 14, 1.0),
                            elevation: 4.0, // gives 3d effect to button

                            child: new Text(
                              "Mark " ,
                              style: new TextStyle( fontWeight: FontWeight.w700, color: Colors.white , fontSize: 20.0)
                              ,),


                          )
                      )

                    ],
                  ),
                  new ListView.builder(

                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: memList.length,
                      itemBuilder: ( BuildContext context , int index ) {
                        return new Card(
                          child:  new AttMemberProfile( // creating of the child component
                            member: memList[index],
                            onClicked: (String nic){memberSelected(nic);},
                            onRemoved: (String nic){memberRemoved(nic);}, // same goes with on removed
                          ),


                        );
                      }
                  )

                ]
            )
        )
    );
  }
}