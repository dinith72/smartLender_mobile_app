import 'package:flutter/material.dart';

class Images {


    Widget getImg(String url , double width , double height){ // return the specified image wrapped in contaner
      // url - location of the image
      var assetImg = new AssetImage(url); //
      var img = new Image(image: assetImg , width:width , height: height,);
      return new Container(
        child: img,
      );
    }

}