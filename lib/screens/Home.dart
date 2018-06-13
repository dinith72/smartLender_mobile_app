import 'package:flutter/material.dart';
import 'package:mobile_app/components/CustomDrawer.dart';
import 'package:mobile_app/components/appBar.dart';
import 'package:mobile_app/modelClasses/CenterInfo.dart';
import 'package:mobile_app/components/CenterWidget.dart';
import 'package:mobile_app/controller/HomeController.dart';
import 'package:date_format/date_format.dart';


class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);


  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}



class _MyHomePageState extends State<MyHomePage> {
  bool _sendLoacation = false ;
//  String _dateStr = 'Today';
  DateTime _date = DateTime.now();
  String strDate = '';
  double _colAmnt = 0.0 ;
  double _payAmnt = 0.0 ;
  Color _color = new Color.fromRGBO(118,162,237,1.0) ; // the texxt and the card color
  List<CenterInfo> centerList = new List<CenterInfo>();

  @override
  void initState() {
    _date = DateTime.now();
    _colAmnt = HomeController().getTotalCollection(_date);
    _payAmnt = HomeController().getTotalPayments(_date);
    centerList = HomeController().getCenterInfo(_date);
  }
  void locationSwitchclcked(bool val){
    setState(() {
      _sendLoacation = val;
    });
  }



  void nextIconPressed(){
    setState(() {
      _date =   HomeController().getNextDate(_date);
      _colAmnt = HomeController().getTotalCollection(_date);
      _payAmnt = HomeController().getTotalPayments(_date);
      centerList = HomeController().getCenterInfo(_date);
    });

  }
  void previousIconPressed(){
    setState(() {
      _date = HomeController().getPreviousDate(_date);
      _colAmnt = HomeController().getTotalCollection(_date);
      _payAmnt = HomeController().getTotalPayments(_date);
      centerList = HomeController().getCenterInfo(_date);
    });

  }

  @override
  Widget build(BuildContext context) {

//    strDate = formatDate(_date, [yyyy, '-', mm, '-', dd]);
//    String dteNow = formatDate(DateTime.now(),[yyyy, '-', mm, '-', dd] );
//    int result = strDate.compareTo(dteNow);
//    if(result ==1 ){
//      strDate = "Today";
//    }

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
                                new Text(formatDate(_date, [M, '-', d]) , style: new TextStyle(color: _color , fontSize: 35.0 , fontWeight: FontWeight.w900),),
                                new IconButton(
                                    icon:new Icon(Icons.navigate_next, color: _color,size: 50.0,) ,
                                    onPressed: (){nextIconPressed();}
                                ),

                              ],
                            ) ,

                            new Card(
                              margin: new EdgeInsets.symmetric(vertical: 10.0 , horizontal: 3.0),

                              color: _color,

                              child: new Container(
                                padding: new EdgeInsets.symmetric(vertical: 10.0 , horizontal: 2.0),
                                child:new Column(

                                  children: <Widget>[
                                    new Text('Collections' , style: new TextStyle(fontSize: 40.0 , color: new Color.fromRGBO(197, 239, 141, 1.0), fontWeight: FontWeight.w700),),
                                    new Text(_colAmnt.toString() , style: new TextStyle(fontSize: 40.0 , color: new Color.fromRGBO(197, 239, 141, 1.0), fontWeight: FontWeight.w700),),
                                    new Text('Payments' , style: new TextStyle(fontSize: 40.0 ,color: new Color.fromRGBO(158, 3, 41, 1.0), fontWeight: FontWeight.w700),),
                                    new Text(_payAmnt.toString() , style: new TextStyle(fontSize: 40.0 , color: new Color.fromRGBO(158, 3, 41, 1.0), fontWeight: FontWeight.w700),)
                                  ],
                                ) ,

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
