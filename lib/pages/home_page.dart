import 'package:authetify/pages/login_page.dart';
import 'package:authetify/pages/signup_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

class HomePage extends StatefulWidget {
  static const String routeName = '/home';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

  final FirebaseAuth _auth = FirebaseAuth.instance;
  User user;
  bool isLoggedIn = false;
  checkAuthentication() async {
    FirebaseAuth.instance.authStateChanges().listen((user) {
      if (user == null) {
        print("User is null homepage");
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomePage()));
      } else {
        print("User is signed in");
      }
    });
  }

  getUser() async {
    User firebaseUser = await _auth.currentUser;
    await firebaseUser?.reload();
    firebaseUser = await _auth.currentUser;

    if (firebaseUser != null) {
      setState(() {
        this.user = firebaseUser;
        this.isLoggedIn = true;
      });
    }
  }

  navigateToLogin() async {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => LoginPage()));
  }

  @override
  Widget build(BuildContext context) {
    final retailerLogin = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      shadowColor: Colors.cyan,
      color: Color(0xff01A0C7),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          navigateToLogin();
        },
        child: Text("Retailer Login",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );
    final buyerLogin = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      shadowColor: Colors.cyan,
      color: Color(0xff01A0C7),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => SignupPage()));
        },
        child: Text("Buyer Login",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 150.0,
                    ),
                    SizedBox(height: 45.0),
                    retailerLogin,
                    SizedBox(height: 45.0),
                    buyerLogin,
                    SizedBox(height: 45.0),
                    SignInButton(
                      Buttons.Google,
                      text: "Sign up with Google",
                      onPressed: () {},
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
