import 'package:flutter/material.dart';
import 'package:mobile_app/otherComponents/EntryItem.dart';
import 'package:mobile_app/otherComponents/Entry.dart';
import 'package:mobile_app/components/CustomDrawer.dart';
import 'package:mobile_app/components/appBar.dart';
import 'package:mobile_app/otherComponents/Images.dart';
import 'package:mobile_app/controller/MemberInfoController.dart';
import 'package:flutter_search_bar/flutter_search_bar.dart';
import 'package:mobile_app/components/alertWindow.dart';
//import 'package:app/main.dart';




class MemberInfo extends StatefulWidget{
  @override
  _MemberInfo createState() => new _MemberInfo();
}

class _MemberInfo extends State<MemberInfo>{
  SearchBar seachbar ;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();


  static final TextEditingController _nic  = new TextEditingController();
  List<Entry> memberDetials = new List<Entry>(); // all the member details are shown in here

  String _teamval ; // the selected team
  List<String> teams = new List<String>(); // list of tems in the center

  String _centerval ; // the selected center
  List<String> _centers = new List<String>(); // list of centers

  String _memberval ; // the selected members
  List<String> _mem = new List<String>(); // list of memebers in selected team

  String _attendence = '' ;
  String _repayement = '';


  @override
  void initState() {
    teams = MemberInfoController().getTeams();
    _teamval = teams[0];
    _centers = MemberInfoController().getCenters();
    _centerval = _centers[0];
    _mem = MemberInfoController().getMembers();
    _memberval = _mem[0];

    memberDetials = MemberInfoController().getMemberDetails();
    _attendence = MemberInfoController().getAtendence();
    _repayement = MemberInfoController().getRepayment();


  }
  AppBar buildAppBar(BuildContext context) {
    return new AppBar(
        title: new Text('Member Info'),
        backgroundColor: new Color.fromRGBO(204, 159, 14, 1.0),
        actions: [seachbar.getSearchAction(context)]);
  }

  void onSubmitted(String value) {
//    setState(() => _scaffoldKey.currentState
//        .showSnackBar(new SnackBar(content: new Text('You wrote $value!'))));
  AlertDialog dialog = alertWindow().WarningWindow(context) ;
  showDialog(context: context,child: dialog);
  }
  _MemberInfo() {
    seachbar = new SearchBar(
        inBar: false,
        buildDefaultAppBar: buildAppBar,
        setState: setState,
        onSubmitted: onSubmitted);

  }



  void centerTextChanged(){


  }

  void nicTextchanged() {
    print(_nic.text);
    AlertDialog alert = alertWindow().WarningWindow(context) ;
    showDialog(context: context,child: alert);
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

  


  Widget build(BuildContext context) {
    return new Scaffold(
//        appBar: CustomAppBar().getAppBar(context, 'Member Info'),
        appBar: seachbar.build(context),
key: _scaffoldKey,
//
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
                              items: _mem.map((String members){
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
                    ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount:memberDetials.length ,
                      itemBuilder: (BuildContext context, int index){
                        return EntryItem(memberDetials[index]);
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

