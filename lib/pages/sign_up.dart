import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:myclinic/pages/login1.dart';
import 'home.dart';
import '../db/user.dart';

class SignUp extends StatefulWidget {
  final Function toggleView;
  SignUp({this.toggleView});
  @override
  _SignUpState createState() => _SignUpState();
}

/*class ImageList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150.0,
      child: ListView(scrollDirection: Axis.vertical, children: <Widget>[
        Category(
          imagecaption: "Choose Photo",
          imagelocation: 'Img/pages/cam.png',
        ),
      ]),
    );
  }
}
*/
class Category extends StatelessWidget {
  final String imagecaption;
  final String imagelocation;
  Category({this.imagecaption, this.imagelocation});

  File imageFile;
  final picker = ImagePicker();

  _OpenCamera(BuildContext context) async {
    var pic = await picker.getImage(source: ImageSource.camera);
    setState(() {
      if (pic != null) {
        imageFile = File(pic.path);
      } else {
        print('No image selected.');
      }
    });
    Navigator.of(context).pop();
  }

  _OpenGallary(BuildContext context) async {
    var pic = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      if (pic != null) {
        imageFile = File(pic.path);
      } else {
        print('No image selected.');
      }
    });
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    var inkWell = InkWell(
        onTap: () {
          showDialog(
              context: context,
              builder: (context) {
                return new AlertDialog(
                  title: new Text("Choose Photo"),
                  actions: <Widget>[
                    new FlatButton.icon(
                      icon: Icon(Icons.camera),
                      label: Text(' Taka Photo ',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black)),
                      onPressed: () {
                        // _OpenCamera();
                      },
                    ),
                    new FlatButton.icon(
                      label: Text(' Choose From gallery ',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black)),
                      icon: Icon(Icons.image),
                      onPressed: () {
                        //  _OpenGallary();
                      },
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
              width: 2.0,
              height: 120.0,
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

  void setState(Null Function() param0) {}
}

class _SignUpState extends State<SignUp> {
  final _formkey = GlobalKey<FormState>();
  UserServices _userServices = UserServices();
  bool hidePass = true;
  bool loading = false;
  TextEditingController _emailTextControler = TextEditingController();
  TextEditingController _passwordTextControler = TextEditingController();
  TextEditingController _confirmpasswordTextControler = TextEditingController();
  TextEditingController _nameTextControler = TextEditingController();
  TextEditingController _phoneTextControler = TextEditingController();
  TextEditingController _ageTextControler = TextEditingController();
  String groupValue = "male";
  String gender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: new Text(
          "New Account",
          style: TextStyle(color: Colors.white),
        ),
        elevation: 0.1,
      ),
      body: new ListView(
        children: <Widget>[
          new Form(
            key: _formkey,
            child: new Column(children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: new Text('Registeration',
                    style: TextStyle(color: Colors.blue)),
              ),

///////////////////////////////               Name                    ///////////////////////////////////////////
              Padding(
                padding: const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                child: Material(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.grey.withOpacity(0.2),
                  elevation: 0.0,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 12.0),
                    child: ListTile(
                      title: TextFormField(
                        controller: _nameTextControler,
                        decoration: InputDecoration(
                            hintText: "Full name",
                            icon: Icon(Icons.person_outline),
                            border: InputBorder.none),
                        validator: (value) {
                          if (value.isEmpty) {
                            return "The name field cannot be empty";
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                ),
              ),
///////////////////////////////               Email                    ///////////////////////////////////////////
              Padding(
                padding: const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                child: Material(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.grey.withOpacity(0.2),
                  elevation: 0.0,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 12.0),
                    child: ListTile(
                      title: TextFormField(
                        controller: _emailTextControler,
                        decoration: InputDecoration(
                            hintText: "Email",
                            icon: Icon(Icons.alternate_email),
                            border: InputBorder.none),
                        validator: (value) {
                          if (value.isEmpty) {
                            Pattern pattern =
                                r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                            RegExp regex = new RegExp(pattern);
                            if (!regex.hasMatch(value))
                              return 'Please make sure your email address is valid';
                            else
                              return null;
                          }
                        },
                      ),
                    ),
                  ),
                ),
              ),
///////////////////////////////               Phone                    ///////////////////////////////////////////
              Padding(
                padding: const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                child: Material(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.grey.withOpacity(0.2),
                  elevation: 0.0,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 12.0),
                    child: ListTile(
                      title: TextFormField(
                        controller: _phoneTextControler,
                        decoration: InputDecoration(
                            hintText: "Phone Number",
                            icon: Icon(Icons.phone),
                            border: InputBorder.none),
                        validator: (value) {
                          if (value.isEmpty) {
                            return "The name field cannot be empty";
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                ),
              ),
///////////////////////////////               Age                    ///////////////////////////////////////////
              Padding(
                padding: const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                child: Material(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.grey.withOpacity(0.2),
                  elevation: 0.0,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 12.0),
                    child: ListTile(
                      title: TextFormField(
                        controller: _ageTextControler,
                        decoration: InputDecoration(
                            hintText: "Age",
                            icon: Icon(Icons.date_range),
                            border: InputBorder.none),
                        validator: (value) {
                          if (value.isEmpty) {
                            return "The name field cannot be empty";
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                ),
              ),
///////////////////////////////               gender                    ///////////////////////////////////////////
              Row(
                children: <Widget>[
                  Expanded(
                      child: ListTile(
                    title: Text(
                      "male",
                      textAlign: TextAlign.end,
                      style: TextStyle(color: Colors.black),
                    ),
                    trailing: Radio(
                        value: "male",
                        groupValue: groupValue,
                        onChanged: (e) => ValueChanged(e)),
                  )),
                  Expanded(
                      child: ListTile(
                    title: Text(
                      "female",
                      textAlign: TextAlign.end,
                      style: TextStyle(color: Colors.black),
                    ),
                    trailing: Radio(
                        value: "female",
                        groupValue: groupValue,
                        onChanged: (e) => ValueChanged(e)),
                  )),
                ],
              ),
///////////////////////////////               Password                    ///////////////////////////////////////////
              Padding(
                padding: const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                child: Material(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.grey.withOpacity(0.2),
                  elevation: 0.0,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 12.0),
                    child: ListTile(
                      title: TextFormField(
                        controller: _passwordTextControler,
                        obscureText: hidePass,
                        decoration: InputDecoration(
                            hintText: "Password",
                            icon: Icon(Icons.lock_outline),
                            border: InputBorder.none),
                        validator: (value) {
                          if (value.isEmpty) {
                            return "The password field cannot be empty";
                          } else if (value.length < 6) {
                            return "the password has to be at least 6 characters long";
                          }
                          return null;
                        },
                      ),
                      trailing: IconButton(
                          icon: Icon(Icons.remove_red_eye),
                          onPressed: () {
                            setState(() {
                              hidePass = false;
                            });
                          }),
                    ),
                  ),
                ),
              ),
///////////////////////////////               Confirm Password                    ///////////////////////////////////////////
              Padding(
                padding: const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                child: Material(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.grey.withOpacity(0.2),
                  elevation: 0.0,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 12.0),
                    child: ListTile(
                      title: TextFormField(
                        controller: _confirmpasswordTextControler,
                        obscureText: hidePass,
                        decoration: InputDecoration(
                            hintText: "Confirm Password",
                            icon: Icon(Icons.lock_outline),
                            border: InputBorder.none),
                        validator: (value) {
                          if (value.isEmpty) {
                            return "The password field cannot be empty";
                          } else if (value.length < 6) {
                            return "the password has to be at least 6 characters long";
                          } else if (_passwordTextControler.text != value) {
                            return "Password is not match";
                          }
                          return null;
                        },
                      ),
                      trailing: IconButton(
                          icon: Icon(Icons.remove_red_eye),
                          onPressed: () {
                            setState(() {
                              hidePass = false;
                            });
                          }),
                    ),
                  ),
                ),
              ),
              // ImageList(),
///////////////////////////////               Register                    ///////////////////////////////////////////
              Padding(
                padding: const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                child: Material(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Colors.blue,
                    elevation: 0.0,
                    child: MaterialButton(
                      onPressed: () async {
                        validateForm();
                        //Navigator.pop(context);
                        // widget.toggleView();
                        /* if (_formkey.currentState.validate()) {
                          print(_nameTextControler);
                          print(_emailTextControler);
                          print(_passwordTextControler);
                          print(_phoneTextControler);
                          print(_ageTextControler);
                        }*/
                      },
                      minWidth: MediaQuery.of(context).size.width,
                      child: Text(
                        "Sign up",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0),
                      ),
                    )),
              ),
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        "I already have an account",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.blue, fontSize: 16),
                      ))),
            ]),
          ), /////////////////////////////////////////////////////////////////////////
        ],
      ),
    );
  }

  ValueChanged(e) {
    setState(() {
      if (e == "male") {
        gender = e;
        groupValue = e;
      } else if (e == "female") {
        groupValue = e;
        gender = e;
      }
    });
  }

/*AuthResult result = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: _email, password: _password);
FirebaseUser user = result.user
await FirebaseFirestore.instance.collection('users')
      .doc(user.uid).set({ 'firstName': _firstName'})*/

  Future validateForm() async {
    FormState formState = _formkey.currentState;
    if (formState.validate()) {
      var firebaseAuth;

      FirebaseUser user = await firebaseAuth.currentUser();
      if (user == null) {
        firebaseAuth
            .createUserWithEmailAndPassword(
                name: _nameTextControler.text,
                email: _emailTextControler.text,
                phone: _phoneTextControler.text,
                age: _ageTextControler.text,
                password: _passwordTextControler.text)
            .then((user) => {
                  _userServices.createUser({
                    "username": _nameTextControler.text,
                    "email": _emailTextControler.text,
                    "userId": user.uid,
                  })
                })
            .catchError((e) => {print(e.toString())});
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Login()));
      }
    }
  }
}
