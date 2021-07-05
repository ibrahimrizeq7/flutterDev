import 'package:flutter/material.dart';
//import 'package:carousel_pro/carousel_pro.dart';

class RetinaDetials extends StatefulWidget {
  @override
  _RetinaDetialsState createState() => _RetinaDetialsState();
}

class VerticalList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180.0,
      child: ListView(scrollDirection: Axis.vertical, children: <Widget>[
        Category(
          imagecaption: "Retina Doctor's",
          imagelocation: 'Img/Retina1.png',
        ),
      ]),
    );
  }
}

class Category extends StatelessWidget {
  final String imagecaption;
  final String imagelocation;
  Category({this.imagecaption, this.imagelocation});

  @override
  Widget build(BuildContext context) {
    var inkWell = InkWell(
        onTap: () {
          showDialog(
              context: context,
              builder: (context) {
                return new AlertDialog(
                  title: new Text("Retina Doctor's"),
                  actions: <Widget>[
                    new FlatButton.icon(
                      label: Text(' د/ مهـــدي مــواس',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black)),
                      icon: Icon(Icons.save),
                      onPressed: () {},
                    ),
                    new FlatButton.icon(
                      label: Text(' د/ راشـــد نــزال',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black)),
                      icon: Icon(Icons.save),
                      onPressed: () {},
                    ),
                    new FlatButton.icon(
                      label: Text(' د/ مـــحمد عبدالله',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black)),
                      icon: Icon(Icons.save),
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
              width: 150.0,
              height: 150.0,
            ),
            subtitle: Container(
              alignment: Alignment.topCenter,
              child: Text(
                imagecaption,
                style: new TextStyle(fontSize: 20.0),
              ),
            )));
    return Padding(
      padding: const EdgeInsets.all(0.0),
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

class _RetinaDetialsState extends State<RetinaDetials> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text('Retina'),
        actions: <Widget>[
          new IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.white,
              ),
              onPressed: () {})
        ],
      ),
      body: ListView(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: MaterialButton(
                  onPressed: () {},
                  color: Colors.blue,
                  elevation: 0.2,
                  textColor: Colors.white,
                  child: Row(
                    children: <Widget>[
                      Expanded(child: new Text("What is Retina")),
                      Expanded(child: new Icon(Icons.remove_red_eye)),
                    ],
                  ),
                ),
              ),
            ],
          ),
          new Padding(
            padding: const EdgeInsets.all(13.0),
            child: new Text(
                "corneal reflex a reflex action of the eye resulting in automatic closing of the eyelid when the cornea is stimulated. The corneal reflex can be elicited in a normal person by gently touching the cornea with a wisp of cotton. Absence of the corneal reflex indicates deep coma or injury of one of the nerves carrying the reflex arc corneal transplantation transplantation of a donor cornea into the eye of a recipient, done to improve the vision of patients with distorted curvature of the cornea (keratoconus) or corneal edema, infection, trauma, or intractable pain. Vision should improve beginning the day after surgery with optimal vision 6 to 12 months later. Because the cornea does not have a blood supply, corneal transplants were one of the earliest successful types of organ transplants. Called also keratoplasty"),
          ),
          //////////////////////////////////////////////////////////
          Row(
            children: <Widget>[
              Expanded(
                child: MaterialButton(
                  onPressed: () {},
                  color: Colors.blue,
                  elevation: 0.2,
                  textColor: Colors.white,
                  child: Row(
                    children: <Widget>[
                      Expanded(child: new Icon(Icons.remove_red_eye)),
                      Expanded(child: new Text("ما هي الشبكية")),
                    ],
                  ),
                ),
              ),
            ],
          ),
          new Padding(
            padding: const EdgeInsets.all(13.0),
            child: new Text(
                "القرنية هى أحد أجزاء العين لونها شفاف سمكها ½ مم وقطرها 12 مم تقريباً. دائرية الشكل ومحدبة وتغطى الجزء الأمامى من العين. ووظيفتها الأساسية تجميع الضوء وتركيزه على شبكية العين بمساعدة عدسة العين، وأى مشكلة أو اضطراب يصيب القرنية يؤدى إلى ضعف شديد فى الإبصار"),
          ),
          VerticalList(),
        ],
      ),
    );
  }
}
