import 'package:authetify/pages/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'login_page.dart';
import 'login_page.dart';

class AddProduct extends StatefulWidget {
  @override
  _AddProductState createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User user;
  bool isLoggedIn = false;

  String uid, userEmail;
  checkAuthentication() async {
    FirebaseAuth.instance.authStateChanges().listen((user) async {
      if (user == null) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => LoginPage()));
      } else {
        print("User is signed in");
      }
    });
  }

  getUser() async {
    User firebaseUser = _auth.currentUser;
    firebaseUser?.reload();
    firebaseUser = _auth.currentUser;

    if (firebaseUser != null) {
      setState(() {
        this.user = firebaseUser;
        this.isLoggedIn = true;
      });
    } else {}
  }

  signOut() async {
    _auth.signOut();

    uid = null;
    userEmail = null;
  }

  @override
  void initState() {
    super.initState();
    this.checkAuthentication();
    this.getUser();
  }

  @override
  Widget build(BuildContext context) {
    print(user);
    return Scaffold(
      appBar: AppBar(
        actions: [
          MaterialButton(
            minWidth: MediaQuery.of(context).size.width,
            padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            onPressed: () {
              signOut();
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LoginPage()));
            },
            child: Text("Sign Out",
                textAlign: TextAlign.center,
                style: style.copyWith(
                    color: Colors.white, fontWeight: FontWeight.bold)),
          ),
        ],
      ),
      body: Container(
          child: !isLoggedIn
              ? CircularProgressIndicator()
              : SingleChildScrollView(
                  child: Container(
                    child: Column(
                      children: <Widget>[
                        Container(
                          height: 400,
                          child: Text("Add a product"),
                        ),
                        Container(
                          child: Text(
                            "Hello you are Logged in as ${user.email}",
                            style: style,
                          ),
                        ),
                      ],
                    ),
                  ),
                )),
    );
  }
}
