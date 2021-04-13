import 'package:authetify/pages/add_product.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  static const String routeName = '/login';

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();

  String _email, _password;

  checkAuthentication() async {
    FirebaseAuth.instance.authStateChanges().listen((user) {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        print('User is signed in!');
      }
    });
  }

  login() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      try {
        UserCredential userCredential = await _auth.signInWithEmailAndPassword(
            email: _email, password: _password);

        Navigator.push(
            context, MaterialPageRoute(builder: (context) => AddProduct()));
      } catch (e) {
        showError(e.errormessage);
      }
    } else {
      print("Akash Raghuwanshi");
    }
  }

  showError(String errormessage) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Error"),
            content: Text(errormessage),
            actions: <Widget>[
              TextButton(
                child: Text('Ok'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }

  @override
  void initState() {
    super.initState();
    this.checkAuthentication();
  }

  @override
  Widget build(BuildContext context) {
    final emailField = TextFormField(
      keyboardType: TextInputType.emailAddress,
      obscureText: false,
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Email",
          labelText: "Email",
          prefixIcon: Icon(Icons.email),
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
      onSaved: (input) => _email = input,
      validator: (input) {
        if (input.isEmpty) {
          return "Enter Email";
        }
        return null;
      },
    );
    final passwordField = TextFormField(
      keyboardType: TextInputType.text,
      obscureText: true,
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Password",
          prefixIcon: Icon(Icons.lock),
          labelText: "Password",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
      onSaved: (input) => _password = input,
      validator: (input) {
        if (input.length < 6) {
          return "Provide Minimum 6 characters";
        }
        return null;
      },
    );
    final loginButon = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(15.0),
      color: Color(0xff01A0C7),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 15.0),
        onPressed: () {
          login();
          print("Akash out");
        },
        child: Text("Login",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page'),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          SingleChildScrollView(
            child: Center(
              child: Container(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(40.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                          height: 100.0,
                        ),
                        SizedBox(height: 45.0),
                        emailField,
                        SizedBox(height: 25.0),
                        passwordField,
                        SizedBox(
                          height: 35.0,
                        ),
                        loginButon,
                        SizedBox(
                          height: 15.0,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
