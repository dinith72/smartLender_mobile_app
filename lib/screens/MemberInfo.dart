import 'package:flutter/material.dart';
import 'package:mobile_app/otherComponents/EntryItem.dart';
import 'package:mobile_app/otherComponents/Entry.dart';
import 'package:mobile_app/components/CustomDrawer.dart';
import 'package:mobile_app/components/appBar.dart';
import 'package:mobile_app/otherComponents/Images.dart';
import 'package:mobile_app/controller/MemberInfoController.dart';
import 'package:material_search/material_search.dart';
import 'package:mobile_app/components/alertWindow.dart';
import 'package:mobile_app/controller/Member.dart';
import 'dart:async';
//import 'package:app/main.dart';




class MemberInfo extends StatefulWidget{
  @override
  _MemberInfo createState() => new _MemberInfo();
}

class _MemberInfo extends State<MemberInfo>{
//  SearchBar seachbar ;
//  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();


  String _nic = "";
  List<Entry> memberDetials = new List<Entry>(); // all the member details are shown in here

  List<String> _members  = new List<String>(); // list containing the names of all the members
  final _formKey = new GlobalKey<FormState>();
  String _name = 'No one';

  String _teamval ; // the selected team
  List<String> teams = new List<String>(); // list of tems in the center

  String _centerval ; // the selected center
  List<String> _centers = new List<String>(); // list of centers

  String _memberval ; // the selected members
  List<String> _memInTeam = new List<String>(); // list of memebers in selected team

  String _attendence = '' ;
  String _repayement = '';


  @override
  void initState() {
    teams = MemberInfoController().getTeams();
    _teamval = teams[0];
    _centers = MemberInfoController().getCenters();
    _centerval = _centers[0];
    _memInTeam = MemberInfoController().getMembers();
    _memberval = _memInTeam[0];

    memberDetials = MemberInfoController().getMemberDetails();
    _attendence = MemberInfoController().getAtendence();
    _repayement = MemberInfoController().getRepayment();

    _members = MemberInfoController().getMembers();


  }
//  AppBar buildAppBar(BuildContext context) {
//    return new AppBar(
//        title: new Text('Member Info'),
//        backgroundColor: new Color.fromRGBO(204, 159, 14, 1.0),
//        actions: [seachbar.getSearchAction(context)]);
//  }









  void centerTextChanged(){


  }


  void dropdownSelected(String teamPicked){
    setState(() {
      _teamval = teamPicked;

    });
  }
  void centerSelected(String centerPicked){
    setState(() {
      _centerval = centerPicked;
    });
  }
  void memberSelected(String memberPicked){
    setState(() {
      _memberval = memberPicked;
    });
  }

  bool memberSearchSelected( dynamic memName){
     _nic = MemberInfoController().getMemNic(memName.toString());
     print(_nic);

     setState(() {
       _memberval = memName.toString();
     });
     return Navigator.of(context).pop(memName);


  }


  _buildMaterialSearchPage(BuildContext context) {
    // retrun to the search window
    return new MaterialPageRoute<String>(
        settings: new RouteSettings(
          name: 'material_search',
          isInitialRoute: false,
        ),
        builder: (BuildContext context) {
          return new Material(
            child: new MaterialSearch<String>(
              placeholder: 'Enter member name',
              results: _members.map((String v) => new MaterialSearchResult<String>(
                icon: Icons.person,
                value: v,
                text: " $v",
              )).toList(),
              filter: (dynamic value, String criteria) {

                return value.toLowerCase().trim()
                    .contains(new RegExp(r'' + criteria.toLowerCase().trim() + ''));
              },
              onSelect: (dynamic value) {
//                print('dyn ' + value.toString() );
               memberSearchSelected( value);

              },
//              onSubmit: (String value) {
//                print('str ' + value);
//                return Navigator.of(context).pop(value);}
            ),
          );
        }
    );
  }
  _showMaterialSearch(BuildContext context) {
    Navigator.of(context)
        .push(_buildMaterialSearchPage(context))
        .then((dynamic value) {
      setState(() => _name = value as String);
    });
//    print(_name);
  }





  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: CustomAppBar().getAppBar(context, 'Member Info'),
//        appBar: seachbar.build(context),
        key: _formKey,
//
        drawer: CustomDrawer().getDrawer(context) ,
        floatingActionButton: new FloatingActionButton(
            onPressed: (){_showMaterialSearch(context) ;},
//            onPressed: null,
            tooltip:  'Search Members',
            child: new Icon(Icons.search , size: 40.0,),
        ),
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

                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[

//                        new Flexible( // should be enclosed in Flexible unless exception is shown
//
//                          child: new TextField( // normal text field data
//                            controller: _center ,
//                            decoration: new InputDecoration( hintText: 'enter center name' , labelText: 'Center '),
//                            onChanged: (String txt){centerTextChanged();},
//                          ),
//                        ),
                        new Container(
                          margin: new EdgeInsets.symmetric(vertical: 2.0 , horizontal: 5.0),
                          child:new DropdownButton(

                              value: _centerval,
                              items: _centers.map((String team){
                                return new DropdownMenuItem(child: new Text(team), value: team,);
                              }).toList(),
                              onChanged: (String cenerPicked){centerSelected(cenerPicked);}
                          ) ,
                        ),
                        new Container(
                          margin: new EdgeInsets.symmetric(vertical: 2.0 , horizontal: 5.0),
                          child:new DropdownButton(

                              value: _teamval,
                              items: teams.map((String team){
                                return new DropdownMenuItem(child: new Text(team), value: team,);
                              }).toList(),
                              onChanged: (String teamPicked){dropdownSelected(teamPicked);}
                          ) ,
                        ),
                        new Container(
                          margin: new EdgeInsets.symmetric(vertical: 2.0 , horizontal: 5.0),
                          child:new DropdownButton(

                              value: _memberval,
                              items: _memInTeam.map((String members){
                                return new DropdownMenuItem(child: new Text(members), value: members,);
                              }).toList(),
                              onChanged: (String memPicked){memberSelected(memPicked);}
                          ) ,
                        ),

                      ],

                    )  ,
                    new Container(
                        margin: new EdgeInsets.symmetric(vertical: 10.0 , horizontal: 10.0),
                        child: new Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            new Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                new Text('Loan Payment', style: new TextStyle(color: Colors.amber, fontSize: 15.0 , fontWeight: FontWeight.w500), ) ,
                                new Text(_repayement , style: new TextStyle(color: Colors.blue , fontSize: 30.0 ,),),
                                new Text('Attendence' , style: new TextStyle(color: Colors.amber, fontSize: 15.0 , fontWeight: FontWeight.w500),),
                                new Text(_attendence , style: new TextStyle(color: Colors.blue , fontSize: 30.0),),
                              ],),
                            Images().getImg('Images/person.png', 120.0, 120.0),
                            Images().getImg('Images/leader.jpg', 60.0, 60.0),
                          ],
                        )
                    ),
                    ListView.builder( // create a new list view
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount:memberDetials.length , // the item count is mentioned in here
                      itemBuilder: (BuildContext context, int index){
                        return EntryItem(memberDetials[index]); // new entry item is retruned
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

