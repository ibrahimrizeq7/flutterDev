import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';

class MakkaDetials extends StatefulWidget {
  @override
  _MakkaDetialsState createState() => _MakkaDetialsState();
}

class _MakkaDetialsState extends State<MakkaDetials> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text('Makka Eye Center'), 
        actions: <Widget>[
          new IconButton(icon: Icon(Icons.search , color: Colors.white,), onPressed: (){} )
          
        ],
      ),
    
     body: new ListView(
   children: <Widget>[
     Container(
       height: 300.0,
       child: new Carousel(
      boxFit: BoxFit.cover,
      /*images:[
        AssetImage('Img/shami/1.jpg'),
        AssetImage('Img/shami/47.jpg'),
        AssetImage('Img/shami/3.jpg'),
        AssetImage('Img/shami/4.jpg'),
        AssetImage('Img/shami/10.jpg'),
        AssetImage('Img/shami/11.jpg'),
      ],*/
      autoplay: true,
      animationCurve: Curves.fastLinearToSlowEaseIn,
      animationDuration: Duration(milliseconds: 1000),
      dotSize: 3.0,
      indicatorBgPadding: 6.0,
   ),
 )
   ],
),
);

  }
}
