import 'package:flutter/material.dart';
import 'package:mobile_app/otherComponents/EntryItem.dart';
import 'package:mobile_app/otherComponents/Entry.dart';
import 'package:mobile_app/components/CustomDrawer.dart';
import 'package:mobile_app/components/appBar.dart';
import 'package:mobile_app/otherComponents/Images.dart';
import 'package:mobile_app/controller/MemberInfoController.dart';
//import 'package:app/main.dart';

class MemberInfo extends StatefulWidget{
  @override
  _MemberInfo createState() => new _MemberInfo();
}

class _MemberInfo extends State<MemberInfo>{
  static final TextEditingController _center  = new TextEditingController();
  static final TextEditingController _nic  = new TextEditingController();
  List<Entry> mainCatagories = new List<Entry>();
  String _teamval ;
  List<String> teams = new List<String>();



  @override
  void initState() {
    teams = MemberInfoController().getTeams();
    _teamval = teams[0];
    mainCatagories =
    [
      new Entry(
          "personal Info",
          <Entry>[
            new Entry('nic'),
            new Entry('name'),
            new Entry('date of birth'),
            new Entry('contact num'),

          ]
      ),
      new Entry(
          'Loan Info',
          <Entry>[
            new Entry('joined date'),
            new Entry('business'),


          ]
      ),
      new Entry(
          'Loan Payment Info',
          <Entry>[
            new Entry('Granted date'),
            new Entry('Amount '),
            new Entry( 'completion '),
            new Entry('last payemnt  '),


          ]
      ),
    ];


  }

  void centerTextChanged(){
    print(_center.text);
  }

  void nicTextchanged() {
    print(_nic.text);
  }
  void dropdownSelected(String teamPicked){
    setState(() {
      _teamval = teamPicked;
    });
  }

  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: CustomAppBar().getAppBar(context, 'Member Info'),
        drawer: CustomDrawer().getDrawer(context) ,
        body:
        new CustomScrollView(
          shrinkWrap : true,
          slivers: <Widget>[
            new SliverPadding(
              padding: const EdgeInsets.all(15.0),
              sliver: new SliverList(
                delegate: new SliverChildListDelegate(

                  <Widget>[

                    new Row(

                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[

                        new Flexible( // should be enclosed in Flexible unless exception is shown

                          child: new TextField( // normal text field data
                            controller: _center ,
                            decoration: new InputDecoration( hintText: 'enter center name' , labelText: 'Center '),
                            onChanged: (String txt){centerTextChanged();},
                          ),
                        ),
                        new Container(
                          margin: new EdgeInsets.symmetric(vertical: 2.0 , horizontal: 20.0),
                          child:new DropdownButton(

                              value: _teamval,
                              items: teams.map((String team){
                                return new DropdownMenuItem(child: new Text(team), value: team,);
                              }).toList(),
                              onChanged: (String teamPicked){dropdownSelected(teamPicked);}
                          ) ,
                        ),

                      ],

                    )  ,
                    Images().getImg('Images/person.png', 50.0, 50.0),
                    new Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new Flexible( // should be enclosed in Flexible unless exception is shown

                          child: new TextField( // normal text field data
                            controller: _nic ,
                            decoration: new InputDecoration( hintText: 'enter nic here  ' , labelText: 'search by nic '),
                            onChanged: (String txt){nicTextchanged();},
                          ),

                        ),
                      ],
                    ),



//                     new DecoratedBox(
//                        decoration: new BoxDecoration(
//                          image: new DecorationImage(
//                            image: new AssetImage('Images/new.png'),
//                          ))),



                    ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount:mainCatagories.length ,
                      itemBuilder: (BuildContext context, int index){
                        return EntryItem(mainCatagories[index]);
                      },

                    ) ,
                  ],
                ),
              ),
            ),
          ],
        )

    );

  }



}