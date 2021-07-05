import 'package:flutter/material.dart';
import 'package:myclinic/pages/home.dart';
import 'package:myclinic/pages/sign_up.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Login extends StatefulWidget {
  final Function toggleView;
  Login({this.toggleView});
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formkey = GlobalKey<FormState>();
  TextEditingController _emailTextControler = TextEditingController();
  TextEditingController _passwordTextControler = TextEditingController();
  bool hidePass = true;
  FirebaseUser _user;
  bool loading = false;
  bool isLogedin = false;
  String error = '';

  final GoogleSignIn googleSignIn = new GoogleSignIn();
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  SharedPreferences preferences;

  @override
  void initState() {
    super.initState();
    initApp();
  }

  void initApp() async {
    FirebaseApp defaultApp = await Firebase.initializeApp();
    firebaseAuth = FirebaseAuth.instanceFor(app: defaultApp);
    // immediately check whether the user is signed in
    checkIfUserisLogedin();
  }

  Future<User> _handleSignIn() async {
    // hold the instance of the authenticated user
    User user;
    // flag to check whether we're signed in already
    bool isSignedIn = await googleSignIn.isSignedIn();
    setState(() {
      isLogedin = loading;
    });
    if (isSignedIn) {
      // if so, return the current user
      user = firebaseAuth.currentUser;
    } else {
      final GoogleSignInAccount googleUser = await googleSignIn.signIn();
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);
      user = (await firebaseAuth.signInWithCredential(credential)).user;
      loading = await googleSignIn.isSignedIn();

      setState(() {
        isLogedin = loading;
      });
    }

    return user;
  }

  void onGoogleSignIn(BuildContext context) async {
    User user = await _handleSignIn();
    var userSignedIn = Navigator.push(
        context, MaterialPageRoute(builder: (context) => HomePage()));
    setState(() {
      isLogedin = userSignedIn == null ? true : false;
    });
  }

  @override
  Widget build(BuildContext context) {
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

    var loginForm = new Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        new Form(
            key: _formkey,
            child: new Column(children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(14.0, 360.0, 14.0, 8.0),
                child: Material(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.grey.withOpacity(0.2),
                  elevation: 0.0,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 12.0),
                    child: TextFormField(
                      controller: _emailTextControler,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Email",
                        icon: Icon(Icons.alternate_email),
                      ),
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
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
              Padding(
                padding: const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                child: Material(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.grey.withOpacity(0.2),
                  elevation: 0.0,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 12.0),
                    child: TextFormField(
                      controller: _passwordTextControler,
                      obscureText: hidePass,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Password",
                        icon: Icon(Icons.lock_outline),
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return "The password field cannot be empty";
                        } else if (value.length < 6) {
                          return "the password has to be at least 6 characters long";
                        }
                        return null;
                      },
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                child: Material(
                  borderRadius: BorderRadius.circular(20.0),
                  color: Colors.blue,
                  elevation: 0.0,
                  child: MaterialButton(
                    onPressed: () async {
                      if (_formkey.currentState.validate()) {
                        onGoogleSignIn(context);
                        print('valid');
                        /*Navigator.push(
                            context,
                           MaterialPageRoute(
                                builder: (context) => HomePage()));*/
                      }
                    },
                    minWidth: MediaQuery.of(context).size.width,
                    child: Text(
                      "Login",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 12.0),
              Text(
                error,
                style: TextStyle(color: Colors.red, fontSize: 14.0),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Forgot password",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  Divider(color: Colors.white),
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignUp()));
                          },
                          child: Text(
                            "Create an account",
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.black),
                          ))),
                ],
              ),
            ])),
        //  loginBtn,
      ],
    );
/////////////////////////////////////////////////////////////////////////////////////////////////////////
    return Scaffold(
      // key: scaffoldKey,
      // resizeToAvoidBottomPadding: false,
      body: Stack(
        children: <Widget>[
          Image.asset(
            'Img/pages/back.jpg',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Positioned(
              width: MediaQuery.of(context).size.width,
              top: MediaQuery.of(context).size.width * 0.20,
              child: Container(
                margin: EdgeInsets.all(16.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset("Img/pages/logo.png", scale: 1.5),
                      SizedBox(
                        height: 10,
                      ),
                      Text("My clinic",
                          style: TextStyle(
                              fontSize: 25,
                              color: Colors.white,
                              fontFamily: 'Open Sans',
                              fontWeight: FontWeight.bold))
                    ]),
              )),
          Container(
            child: new SingleChildScrollView(
              child: loginForm,
            ),
          ),
        ],
      ),
    );
  }
}

class FirebaseUser {}

void checkIfUserisLogedin() {}
