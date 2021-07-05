import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:myclinic/Categories/componants.dart';
import 'package:myclinic/Eye/Eyecenters.dart';
import 'package:myclinic/pages/booking.dart';
import 'package:myclinic/pages/login1.dart';

class HomePage extends StatefulWidget {
  @override
  _HOmePageState createState() => _HOmePageState();
}

class _HOmePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Widget imageCarsouel = new Container(
      height: 300.0,
      child: Container(
        child: new Carousel(
          boxFit: BoxFit.cover,
          images: [
            AssetImage('Img/shami.png'),
            AssetImage('Img/Sudan.png'),
            AssetImage('Img/Alfaisal.jpg'),
            AssetImage('Img/Alzarga.jpg'),
            AssetImage('Img/Makka.jpg'),
            AssetImage('Img/kush.png'),
            //AssetImage('Img/mugla.png'),
          ],
          autoplay: true,
          animationCurve: Curves.fastLinearToSlowEaseIn,
          animationDuration: Duration(milliseconds: 1000),
          dotSize: 2.0,
          indicatorBgPadding: 2.0,
        ),
      ),
    );
    return Scaffold(
      appBar: new AppBar(
        title: Text('My Clinic'),
        actions: <Widget>[
          new IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.white,
              ),
              onPressed: () {})
        ],
      ),
      drawer: new Drawer(
          child: new ListView(children: <Widget>[
        new UserAccountsDrawerHeader(
          accountName: Text(' Ibrahim Rizeq '),
          accountEmail: Text(' 0990660601'),
          currentAccountPicture: GestureDetector(
            child: new CircleAvatar(
              backgroundColor: Colors.grey,
              child: new Icon(
                Icons.person,
                color: Colors.white,
              ),
            ),
          ),
          /* decoration: new BoxDecoration(
             color: Colors.cyan
         ),*/
        ),
//////body/////////
        InkWell(
          onTap: () {
            Navigator.of(context).pop(context);
          },
          child: ListTile(
            title: Text('Home Page'),
            leading: Icon(Icons.home, color: Colors.cyan),
          ),
        ),
///////////////////
        InkWell(
          onTap: () {},
          child: ListTile(
            title: Text('My Account'),
            leading: Icon(Icons.home, color: Colors.cyan),
          ),
        ),
///////////////////

        InkWell(
          onTap: () => Navigator.of(context)
              .push(new MaterialPageRoute(builder: (context) => new Booking())),
          child: ListTile(
            title: Text('Booking'),
            leading: Icon(Icons.book, color: Colors.cyan),
          ),
        ),

//////body/////////
        Divider(),
        InkWell(
          onTap: () {},
          child: ListTile(
            title: Text('Settings'),
            leading: Icon(Icons.settings, color: Colors.cyan),
          ),
        ),
///////////////////

//////body/////////
        InkWell(
            onTap: () {},
            child: ListTile(
              title: Text('About us'),
              leading: Icon(
                Icons.help,
                color: Colors.cyan,
              ),
            )),
/////////body/////////
        InkWell(
            onTap: () => Navigator.of(context)
                .push(new MaterialPageRoute(builder: (context) => new Login())),
            child: ListTile(
              title: Text('Log Out'),
              leading: Icon(
                Icons.exit_to_app,
                color: Colors.cyan,
              ),
            ))
///////////////////
      ])),
      body: new ListView(
        children: <Widget>[
          imageCarsouel,
          new Padding(
            padding: const EdgeInsets.all(10.0),
            child: new Text('Categories ',
                style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          HorizontalList(),
          new Padding(
            padding: const EdgeInsets.all(15.0),
            child: new Text('Eye Centers ',
                style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          Container(
            height: 500.0,
            width: 500.0,
            child: Eyecenters(),
          ),
        ],
      ),
    );
  }
}
