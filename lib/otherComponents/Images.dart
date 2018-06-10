import 'package:flutter/material.dart';

class Images extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    var assetImg = new AssetImage('Images/person.png');
    var img = new Image(image: assetImg , width:150.0 , height: 150.0,);
    return new Container(
      child: img,
    );
  }

    Widget getImg(String url , double width , double height){
      var assetImg = new AssetImage(url); //
      var img = new Image(image: assetImg , width:width , height: height,);
      return new Container(
        child: img,
      );
    }

}