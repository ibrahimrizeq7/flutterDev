import 'package:flutter/material.dart';
import 'package:myclinic/Categories/Retina.dart';
import 'package:myclinic/Categories/Corneal.dart';
import 'package:myclinic/Categories/Squint.dart';
import 'package:myclinic/Categories/Glaucoma.dart';

class HorizontalList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130.0,
      
      child: ListView(scrollDirection: Axis.horizontal, children: <Widget>[
        Category(
          imagelocation: 'Img/Retina1.png',
          imagecaption: 'Retina',
        ),
        Category1(
          imagelocation: 'Img/Corneal1.png',
          imagecaption: 'Corneal',
        ),
        Category2(
          imagelocation: 'Img/Squint1.png',
          imagecaption: 'Squint and clild',
        ),
        Category3(
          imagelocation: 'Img/Phaco1.png',
          imagecaption: 'Glaucoma',
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
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: InkWell(
        onTap: () {},
        child: Container(
          width: 150.0,
          child: Material(
            child: InkWell(
                onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                    builder: (context) => new RetinaDetials())),
                child: ListTile(
                    title: Image.asset(
                      imagelocation,
                      width: 160.0,
                      height: 160.0,
                    ),
                    subtitle: Container(
                      alignment: Alignment.topCenter,
                      child: Text(
                        imagecaption,
                        style: new TextStyle(fontSize: 15.0),
                      ),
                    ))),
          ),
        ),
      ),
    );
  }
}

class Category1 extends StatelessWidget {
  final String imagelocation;
  final String imagecaption;

  Category1({this.imagelocation, this.imagecaption});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: InkWell(
        onTap: () {},
        child: Container(
          width: 150.0,
          child: Material(
            child: InkWell(
                onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                    builder: (context) => new CornealDetials())),
                child: ListTile(
                    title: Image.asset(
                      imagelocation,
                      width: 160.0,
                      height: 160.0,
                    ),
                    subtitle: Container(
                      alignment: Alignment.topCenter,
                      child: Text(
                        imagecaption,
                        style: new TextStyle(fontSize: 15.0),
                      ),
                    ))),
          ),
        ),
      ),
    );
  }
}

class Category2 extends StatelessWidget {
  final String imagelocation;
  final String imagecaption;

  Category2({this.imagelocation, this.imagecaption});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: InkWell(
        onTap: () {},
        child: Container(
          width: 150.0,
          child: Material(
            child: InkWell(
                onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                    builder: (context) => new SquintDetials())),
                child: ListTile(
                    title: Image.asset(
                      imagelocation,
                      width: 160.0,
                      height: 160.0,
                    ),
                    subtitle: Container(
                      alignment: Alignment.topCenter,
                      child: Text(
                        imagecaption,
                        style: new TextStyle(fontSize: 15.0),
                      ),
                    ))),
          ),
        ),
      ),
    );
  }
}

class Category3 extends StatelessWidget {
  final String imagelocation;
  final String imagecaption;

  Category3({this.imagelocation, this.imagecaption});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: InkWell(
        onTap: () {},
        child: Container(
          width: 150.0,
          child: Material(
            child: InkWell(
                onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                    builder: (context) => new GlaucomaDetials())),
                child: ListTile(
                    title: Image.asset(
                      imagelocation,
                      width: 160.0,
                      height: 160.0,
                    ),
                    subtitle: Container(
                      alignment: Alignment.topCenter,
                      child: Text(
                        imagecaption,
                        style: new TextStyle(fontSize: 15.0),
                      ),
                    ))),
          ),
        ),
      ),
    );
  }
}
