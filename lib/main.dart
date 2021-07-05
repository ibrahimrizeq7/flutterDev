import 'package:flutter/material.dart';
import 'package:myclinic/pages/home.dart';
import 'package:myclinic/pages/login1.dart';
import 'package:myclinic/pages/sign_up.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(new MyApp());
}

final routes = {
  '/login': (BuildContext context) => new Login(),
  '/home': (BuildContext context) => new HomePage(),
  '/': (BuildContext context) => new Login(),
  'sign_up': (BuildContext context) => new SignUp(),
};

class MyApp extends StatelessWidget {
  bool showSignIn = true;
  /*void toggleView() {
    setState(() => showSignIn = !showSignIn);
  }*/

  @override
  Widget build(BuildContext context) {
    /*if (showSignIn) {
      return SignUp(toggleView: toggleView);
    } else {
      return HomePage(toggleView: toggleView);
    }*/

    return new MaterialApp(
      //future: Firebase.initializeApp(),
      routes: routes,
      debugShowCheckedModeBanner: false,
    );
  }
}
