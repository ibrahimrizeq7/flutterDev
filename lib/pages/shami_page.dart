import 'dart:async';

import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:video_player/video_player.dart';

class ShamiDetials extends StatefulWidget {
  @override
  _ShamiDetialsState createState() => _ShamiDetialsState();
}

DateTime _dateTime;

class _onDropDownItemSelected {
  _onDropDownItemSelected(String newValueSelected);
}

class HorizontalList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150.0,
      child: ListView(scrollDirection: Axis.horizontal, children: <Widget>[
        Category(
          imagelocation: 'Img/pages/categoris.jpg',
          imagecaption: 'Categories',
        ),
        Category1(
          imagelocation: 'Img/pages/doctors-.jpg',
          imagecaption: 'Available Doctors',
        ),
        Category2(
          imagelocation: 'Img/pages/insurance.jpg',
          imagecaption: 'Part of Insurance',
        ),
        Category3(
          imagelocation: 'Img/pages/time.jpg',
          imagecaption: 'times of work',
        ),
        Category4(
          imagelocation: 'Img/pages/about.jpg',
          imagecaption: 'About Shami Eye',
        ),
      ]),
    );
  }
}

class Category extends StatelessWidget {
  final String imagelocation;
  final String imagecaption;

  Category({this.imagelocation, this.imagecaption});

  @override
  Widget build(BuildContext context) {
    var inkWell = InkWell(
        onTap: () {
          showDialog(
              context: context,
              builder: (context) {
                return new AlertDialog(
                  title: new Text("Categories"),
                  content: new Text("Cornea"
                      "\n\n"
                      "Retina"
                      "\n\n"
                      "Squint "
                      "\n\n"
                      "Glaucoma"),
                  actions: <Widget>[
                    new MaterialButton(
                      onPressed: () {
                        Navigator.of(context).pop(context);
                      },
                      child: new Text("Close"),
                    ),
                  ],
                );
              });
        },
        child: ListTile(
            title: Image.asset(
              imagelocation,
              width: 180.0,
              height: 180.0,
            ),
            subtitle: Container(
              alignment: Alignment.topCenter,
              child: Text(
                imagecaption,
                style: new TextStyle(fontSize: 15.0),
              ),
            )));
    return Padding(
      padding: const EdgeInsets.all(22.0),
      child: InkWell(
        onTap: () {},
        child: Container(
          width: 150.0,
          child: Material(
            child: inkWell,
          ),
        ),
      ),
    );
  }
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////
class Category1 extends StatelessWidget {
  final String imagelocation;
  final String imagecaption;

  Category1({this.imagelocation, this.imagecaption});

  @override
  Widget build(BuildContext context) {
    var inkWell = InkWell(
        onTap: () {
          showDialog(
              context: context,
              builder: (context) {
                return new AlertDialog(
                  title: ListTile(
                    title: new Text("Available Doctor's "),
                  ),
                  actions: <Widget>[
                    new FlatButton.icon(
                      label: Text(' د/ مهـدي مــواس',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black)),
                      icon: Icon(
                        Icons.person_outline,
                        color: Colors.red,
                      ),
                      onPressed: () {},
                    ),
                    new FlatButton.icon(
                      label: Text('د/ وســام شحـاده',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black)),
                      icon: Icon(
                        Icons.person_outline,
                        color: Colors.red,
                      ),
                      onPressed: () {},
                    ),
                    new FlatButton.icon(
                      label: Text(' د/ ممــدوح منــاع',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black)),
                      icon: Icon(
                        Icons.person_outline,
                        color: Colors.green,
                      ),
                      onPressed: () {},
                    ),
                    new FlatButton.icon(
                      label: Text('د/ راشـــد نــــزال',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black)),
                      icon: Icon(
                        Icons.person_outline,
                        color: Colors.green,
                      ),
                      onPressed: () {},
                    ),
                    new FlatButton.icon(
                      label: Text(" د/ محــــمد يـــس",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black)),
                      icon: Icon(
                        Icons.person_outline,
                        color: Colors.green,
                      ),
                      onPressed: () {},
                    ),
                    new FlatButton.icon(
                      label: Text(' د/ مــهند هلــيس ',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black)),
                      icon: Icon(
                        Icons.person_outline,
                        color: Colors.green,
                      ),
                      onPressed: () {},
                    ),
                    new FlatButton.icon(
                      label: Text(' د/ عـــمر الزعــبي ',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black)),
                      icon: Icon(
                        Icons.person_outline,
                        color: Colors.red,
                      ),
                      onPressed: () {},
                    ),
                    new MaterialButton(
                      onPressed: () {
                        Navigator.of(context).pop(context);
                      },
                      child: new Text("Close"),
                    ),
                  ],
                );
              });
        },
        child: ListTile(
            title: Image.asset(
              imagelocation,
              width: 180.0,
              height: 180.0,
            ),
            subtitle: Container(
              alignment: Alignment.topCenter,
              child: Text(
                imagecaption,
                style: new TextStyle(fontSize: 15.0),
              ),
            )));
    return Padding(
      padding: const EdgeInsets.all(22.0),
      child: InkWell(
        onTap: () {},
        child: Container(
          width: 150.0,
          child: Material(
            child: inkWell,
          ),
        ),
      ),
    );
  }
}

//////////////////////////////////////////////////////////////////////
class Category2 extends StatelessWidget {
  final String imagelocation;
  final String imagecaption;

  Category2({this.imagelocation, this.imagecaption});

  @override
  Widget build(BuildContext context) {
    var inkWell = InkWell(
        onTap: () {
          showDialog(
              context: context,
              builder: (context) {
                return new AlertDialog(
                  title: new Text("Part of Insurance "),
                  content: new Text(" Medical of Islamic "
                      "\n\n"
                      " Medical of Mutkhasisa"
                      "\n\n"
                      " Medical of Tawnia"
                      "\n\n"
                      " Prime Helth"
                      "\n\n"
                      " Oil Enargy"
                      "\n\n"
                      " VIP Pluse"),
                  actions: <Widget>[
                    new MaterialButton(
                      onPressed: () {
                        Navigator.of(context).pop(context);
                      },
                      child: new Text("Close"),
                    ),
                  ],
                );
              });
        },
        child: ListTile(
            title: Image.asset(
              imagelocation,
              width: 180.0,
              height: 180.0,
            ),
            subtitle: Container(
              alignment: Alignment.topCenter,
              child: Text(
                imagecaption,
                style: new TextStyle(fontSize: 15.0),
              ),
            )));
    return Padding(
      padding: const EdgeInsets.all(22.0),
      child: InkWell(
        onTap: () {},
        child: Container(
          width: 150.0,
          child: Material(
            child: inkWell,
          ),
        ),
      ),
    );
  }
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////
class Category3 extends StatelessWidget {
  final String imagelocation;
  final String imagecaption;

  Category3({this.imagelocation, this.imagecaption});

  @override
  Widget build(BuildContext context) {
    var inkWell = InkWell(
        onTap: () {
          showDialog(
              context: context,
              builder: (context) {
                return new AlertDialog(
                  title: new Text("About Shami Eye Center"),
                  content: new Text("Satrday  8:00 AM - 4:00 PM"
                      "\n\n"
                      "Sunday  8:00 AM - 4:00 PM"
                      "\n\n"
                      "Monday  8:00 AM - 4:00 PM"
                      "\n\n"
                      "Tusday  8:00 AM - 4:00 PM"
                      "\n\n"
                      "Wensday 8:00 AM - 4:00 PM"
                      "\n\n"
                      "Thursday8:00 AM - 4:00 PM"
                      "\n\n"),
                  actions: <Widget>[
                    new MaterialButton(
                      onPressed: () {
                        Navigator.of(context).pop(context);
                      },
                      child: new Text("Close"),
                    ),
                  ],
                );
              });
        },
        child: ListTile(
            title: Image.asset(
              imagelocation,
              width: 180.0,
              height: 180.0,
            ),
            subtitle: Container(
              alignment: Alignment.topCenter,
              child: Text(
                imagecaption,
                style: new TextStyle(fontSize: 15.0),
              ),
            )));
    return Padding(
      padding: const EdgeInsets.all(22.0),
      child: InkWell(
        onTap: () {},
        child: Container(
          width: 150.0,
          child: Material(
            child: inkWell,
          ),
        ),
      ),
    );
  }
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////
class Category4 extends StatelessWidget {
  final String imagelocation;
  final String imagecaption;

  Category4({this.imagelocation, this.imagecaption});

  @override
  Widget build(BuildContext context) {
    var inkWell = InkWell(
        onTap: () {
          showDialog(
              context: context,
              builder: (context) {
                return new AlertDialog(
                  title: new Text("About Shami Eye"),
                  content: new Text("مقابلة الطبيب وفحص النظر 600 جنية "
                      "\n"
                      "\n"
                      "موقع المركز : الخرطوم - بري امتداد ناصر - شارع  مامون البرير"
                      "\n"
                      "\n"
                      "للاستفسار على الخط الساخن : 2383"),
                  actions: <Widget>[
                    new MaterialButton(
                      onPressed: () {
                        Navigator.of(context).pop(context);
                      },
                      child: new Text("Close"),
                    ),
                  ],
                );
              });
        },
        child: ListTile(
            title: Image.asset(
              imagelocation,
              width: 180.0,
              height: 180.0,
            ),
            subtitle: Container(
              alignment: Alignment.topCenter,
              child: Text(
                imagecaption,
                style: new TextStyle(fontSize: 15.0),
              ),
            )));
    return Padding(
      padding: const EdgeInsets.all(22.0),
      child: InkWell(
        onTap: () {},
        child: Container(
          width: 150.0,
          child: Material(
            child: inkWell,
          ),
        ),
      ),
    );
  }
}

////////////////////////////////////////////////////////////
class _ShamiDetialsState extends State<ShamiDetials> {
  bool switchControl = false;
  var textHolder = 'Switch is OFF';

  void toggleSwitch(bool value) {
    if (switchControl == false) {
      setState(() {
        switchControl = true;
        textHolder = ' أحجز لنفسك';
      });
      print('أحجز لنفسك');
    } else {
      setState(() {
        switchControl = false;
        textHolder = ' أحجز لغيرك';
      });
      print(' أحجز لغيرك');
      // Put your code here which you want to execute on Switch OFF event.
    }
  }

  var _currentInsurance = 'Medical of Islamic';
  var _insurance = [
    'Medical of Islamic',
    'Medical of Mutkhasisa',
    'Medical of Tawnia',
    'Prime Helth',
    'Oil Enargy',
    'VIP Pluse',
    'None'
  ];
  VideoPlayerController _controller;
  Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    _controller = VideoPlayerController.asset("Img/pages/shami.mp4");
    _initializeVideoPlayerFuture = _controller.initialize();
    _controller.setLooping(true);
    _controller.setVolume(1.0);
    super.initState();
  }
 @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    /* Widget imageCarsouel = new Container(
      height: 300.0,
      child: new Carousel(
        boxFit: BoxFit.cover,
        images: [
          AssetImage('Img/shami/1.jpg'),
          AssetImage('Img/shami/47.jpg'),
          AssetImage('Img/shami/3.jpg'),
          AssetImage('Img/shami/4.jpg'),
          AssetImage('Img/shami/10.jpg'),
          AssetImage('Img/shami/11.jpg'),
        ],
        autoplay: true,
        animationCurve: Curves.fastLinearToSlowEaseIn,
        animationDuration: Duration(milliseconds: 1000),
        dotSize: 3.0,
        indicatorBgPadding: 3.0,
      ),
    );*/

    return Scaffold(
      appBar: new AppBar(
        title: Text('Shami Eye Center'),
        actions: <Widget>[
          new IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.white,
              ),
              onPressed: () {})
        ],
      ),
      body: new ListView(
        children: <Widget>[
          FutureBuilder(
            future: _initializeVideoPlayerFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return Center(
                  child: AspectRatio(
                    aspectRatio: _controller.value.aspectRatio,
                    child: VideoPlayer(_controller),
                  ),
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
          HorizontalList(),
//////////////////////////////////////////////////////////////////////////
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: new Text('Registeration'),
          ),
//////////////////////////////////////////////////////////////////////////
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Transform.scale(
                  scale: 1.5,
                  child: Switch(
                    onChanged: toggleSwitch,
                    value: switchControl,
                    activeColor: Colors.blue,
                    activeTrackColor: Colors.green,
                    inactiveThumbColor: Colors.white,
                    inactiveTrackColor: Colors.grey,
                  )),
              Text(
                '$textHolder',
                style: TextStyle(fontSize: 24),
              )
            ]),
          ),
//////////////////////////////////////////////////////////////////////////
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: TextField(
              // controller: nameController,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.person),
                labelText: 'Name',
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.blue,
                  ),
                ),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          //////////////////////////////////////////////////////////////////////////
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: TextField(
              // controller: phoneController,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.phone),
                labelText: 'Number Phone',
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.blue,
                  ),
                ),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          //////////////////////////////////////////////////////////////////////////
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
          ),
//////////////////////////////////////////////////////////////////////
          Center(
            child: DropdownButton<String>(
              items: _insurance.map((String dropdownStringItem) {
                return DropdownMenuItem<String>(
                  value: dropdownStringItem,
                  child: Text(dropdownStringItem),
                );
              }).toList(),
              onChanged: (String newValueSelected) {
                _onDropDownItemSelected(newValueSelected);
                //newValue = newValueSelected;
              },
              value: _currentInsurance,
            ),
          ),
          //////////////////////////////////////////////////////////////////////////
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 18.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(_dateTime == null
                    ? 'Nothing has been picked yet'
                    : _dateTime.toString()),
                RaisedButton(
                  child: Text(
                    'Pick a date',
                    style: TextStyle(color: Colors.white),
                  ),
                  color: Colors.blue,
                  onPressed: () {
                    showDatePicker(
                            context: context,
                            initialDate:
                                _dateTime == null ? DateTime.now() : _dateTime,
                            firstDate: DateTime(2001),
                            lastDate: DateTime(2021))
                        .then((date) {
                      setState(() {
                        _dateTime = date;
                      });
                    });
                  },
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 120.0, vertical: 10.0),
            child: MaterialButton(
              child: Text(
                'Register',
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.blue,
              onPressed: () {
                Navigator.of(context).pop(context);
                setState(() {
                  debugPrint("Save button clicked");
                  //    _save();
                });
                showDialog(
                    context: context,
                    builder: (context) {
                      return new AlertDialog(
                        title: new Text("Register Successful"),
                        actions: <Widget>[
                          new MaterialButton(
                            onPressed: () {
                              Navigator.of(context).pop(context);
                            },
                            child: new Text("Close"),
                          ),
                        ],
                      );
                    });
              },
            ),
          ),

          Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 0.0),
              child: ListTile(
                title: Text('Available Doctors'),
                leading: Icon(
                  Icons.person_outline,
                  color: Colors.green,
                ),
              )),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 0.0),
              child: ListTile(
                title: Text('Not Available Doctors'),
                leading: Icon(
                  Icons.person_outline,
                  color: Colors.red,
                ),
              )),
        ],
      ),
    );
  }
}
