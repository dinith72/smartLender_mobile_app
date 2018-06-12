import 'package:flutter/material.dart';
import 'package:mobile_app/components/CustomDrawer.dart';
import 'package:mobile_app/components/appBar.dart';
import 'package:mobile_app/modelClasses/CenterInfo.dart';
import 'package:mobile_app/components/CenterWidget.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);


  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}



class _MyHomePageState extends State<MyHomePage> {
  bool _sendLoacation = false ;
  String _date = 'Today';
  double _colAmnt = 0.0 ;
  double _payAmnt = 0.0 ;
  Color _color = new Color.fromRGBO(211, 191, 139,1.0) ; // the texxt and the card color
  List<CenterInfo> centerList = new List<CenterInfo>();


  void locationSwitchclcked(bool val){
    setState(() {
      _sendLoacation = val;
    });
  }
  void nextIconPressed(){
    print('next');
  }
  void previousIconPressed(){
    print('previos');
  }

  @override
  Widget build(BuildContext context) {
    for(int i =0 ; i < 4 ; i++){
      CenterInfo center = new CenterInfo();
      center.name = 'yakkala';
      center.collections = 12500.0;
      center.payments = 5000.0 ;
      center.attendemce = 25.0;
      centerList.add(center);
    }
    return new Scaffold(
        appBar: new CustomAppBar().getAppBar(context,'Summary'),
        drawer: new CustomDrawer().getDrawer(context),

        body: CustomScrollView(

            shrinkWrap : true,
            slivers: <Widget>[
              new SliverPadding(
                  padding: const EdgeInsets.all(15.0),
                  sliver: new SliverList(
                      delegate: new SliverChildListDelegate(
                          <Widget>[
                            new SwitchListTile(
                                title: new Text('GPS location'),
                                value: _sendLoacation,
                                onChanged: (bool value){locationSwitchclcked(value);}
                            ),
                            new Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                new IconButton(
                                    icon: new Icon(Icons.navigate_before , color: _color,size: 50.0,),
                                    onPressed: (){previousIconPressed();}
                                ) ,
                                new Text(_date , style: new TextStyle(color: _color , fontSize: 35.0 , fontWeight: FontWeight.w900),),
                                new IconButton(
                                    icon:new Icon(Icons.navigate_next, color: _color,size: 50.0,) ,
                                    onPressed: (){nextIconPressed();}
                                ),

                              ],
                            ) ,

                            new Card(
                              margin: new EdgeInsets.symmetric(vertical: 10.0 , horizontal: 5.0),
                              color: _color,

                              child: new Column(
                                children: <Widget>[
                                  new Text('Collections' , style: new TextStyle(fontSize: 40.0 , color: Colors.white, fontWeight: FontWeight.w700),),
                                 new Text(_colAmnt.toString() , style: new TextStyle(fontSize: 40.0 , color: Colors.white, fontWeight: FontWeight.w700),),
                              new Text('Payments' , style: new TextStyle(fontSize: 40.0 ,color: new Color.fromRGBO(158, 3, 41, 1.0), fontWeight: FontWeight.w700),),
                            new Text(_payAmnt.toString() , style: new TextStyle(fontSize: 40.0 , color: new Color.fromRGBO(158, 3, 41, 1.0), fontWeight: FontWeight.w700),)
                                ],
                              ),
                            ),

                            new ListView.builder( // create the list view

                                shrinkWrap: true, // essential code , infinete hight is shown without this code
                                scrollDirection: Axis.vertical,
                                itemCount: centerList.length,
                                itemBuilder: ( BuildContext context , int index ) {
                                  return new Card(
                                    child:CenterWidget(centerInfo: centerList[index],) ,
                                  ) ;
                                }
                            )


                          ]
                      )
                  )
              )
            ]
        )
    );

  }
}
