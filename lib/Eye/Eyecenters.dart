import 'package:flutter/material.dart';
import 'package:myclinic/pages/shami_page.dart';
//import 'package:clinicapp/pages/sudan_page.dart';
//import 'package:clinicapp/pages/alfaisal_page.dart';
//import 'package:clinicapp/pages/alzarqa_page.dart';
//import 'package:clinicapp/pages/makka_page.dart';
//import 'package:clinicapp/pages/kush_page.dart';
//import 'package:clinicapp/pages/mugla_page.dart';

class Eyecenters extends StatefulWidget {
  @override
  _EyecentersState createState() => _EyecentersState();
}

class _EyecentersState extends State<Eyecenters> {
  var eyecenterlist = [
    {
      "name": "Shami Eye Center",
      "picture": "Img/shamilogo.png",
    },
    {
      "name": "Sudan Eye Center",
      "picture": "Img/Sudan0.png",
    },
    {
      "name": "Makka Eye Center",
      "picture": "Img/Makka0.png",
    },
    {
      "name": "Al-Zarqa Eye Center",
      "picture": "Img/Alzarga0.png",
    },
    {
      "name": "Kush Eye Center",
      "picture": "Img/kush0.png",
    },
    {
      "name": "Alfaisal Eye Center",
      "picture": "Img/Alfaisal0.png",
    },

    /* {
      "name": "Mugla Eye Center",
      "picture": "Img/mugla.png",
    },*/
  ];
  @override
  Widget build(BuildContext context) {
    var gridView = GridView.builder(
        itemCount: eyecenterlist.length,
        gridDelegate:
            new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return Eyecenter(
            eyename: eyecenterlist[index]['name'],
            eyepicture: eyecenterlist[index]['picture'],
          );
        });
    return gridView;
  }
}

class Eyecenter extends StatelessWidget {
  final eyename;
  final eyepicture;

  Eyecenter({
    this.eyename,
    this.eyepicture,
  });
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        height: 100.0,
        width: 100.0,
        child: Hero(
          tag: eyename,
          child: Material(
            child: InkWell(
              onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                  builder: (context) => new ShamiDetials())),
              child: GridTile(
                  footer: Container(
                    color: Colors.white70,
                    child: ListTile(
                      leading: Text(eyename,
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                  ),
                  child: Image.asset(
                    eyepicture,
                    fit: BoxFit.cover,
                  )),
            ),
          ),
        ),
      ),
    );
  }
}
/*
  class Eyecenter1 extends StatelessWidget {
  final eyename;
  final eyepicture;

  Eyecenter1({
    this.eyename,
    this.eyepicture,
   
  });
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        height: 100.0,
        width: 100.0,
      child: Hero(
        tag: eyename,
       child: Material(
         child :InkWell(
           onTap: ()=> Navigator.of(context).push(new MaterialPageRoute(builder: (context)=> new SudanDetials())),
         child: GridTile(
           footer: Container(
             color: Colors.white70,
             child: ListTile(
               leading: Text(eyename, style: TextStyle(fontWeight: FontWeight.bold)),
             ),
           ),
           child: Image.asset(eyepicture,
           fit: BoxFit.cover,)),
         ),
         ),
      ),
      ),
    );

  }
  }
*/
////////////////////////////////////
