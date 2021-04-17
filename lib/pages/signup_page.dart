import 'package:authetify/pages/add_product.dart';
import 'package:authetify/pages/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  static const String routeName = '/signup';
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  User user;

  String uid, userEmail;
  TextEditingController nameInputController;
  TextEditingController emailInputController;
  TextEditingController pwdInputController;
  TextEditingController confirmPwdInputController;

  checkAuthentication() async {
    _auth.authStateChanges().listen((user) async {
      if (user != null) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => AddProduct()));
      }
    });
  }

  signUp() async {
    print("Updated0 ");
    if (_formKey.currentState.validate()) {
      print("Updated1 ");
      if (pwdInputController.text == confirmPwdInputController.text) {
        _formKey.currentState.save();
        try {
          UserCredential result = await _auth.createUserWithEmailAndPassword(
              email: emailInputController.text,
              password: pwdInputController.text);

          user = result.user;
          if (user != null) {
            uid = user.uid;
            userEmail = user.email;
          }
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => LoginPage()));
        } catch (e) {
          print(e.toString());
          return null;
        }
      }
    }
  }

  String emailValidator(value) {
    print(value);
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value)) {
      return 'Email format is invalid';
    } else {
      return null;
    }
  }

  String pwdValidator(value) {
    if (value.length < 8) {
      return 'Password must be longer than 8 characters';
    } else {
      return null;
    }
  }

  @override
  void initState() {
    nameInputController = TextEditingController();
    emailInputController = TextEditingController();
    pwdInputController = TextEditingController();
    confirmPwdInputController = TextEditingController();
    super.initState();
    this.checkAuthentication();
  }

  @override
  @override
  Widget build(BuildContext context) {
    final nameField = TextFormField(
      keyboardType: TextInputType.name,
      obscureText: false,
      style: style,
      controller: nameInputController,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          labelText: "Name",
          hintText: "Name",
          prefixIcon: Icon(Icons.text_format),
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
      validator: (value) {
        if (value.length < 3) {
          return "Please enter a valid name.";
        }
        return null;
      },
    );
    final emailField = TextFormField(
      keyboardType: TextInputType.emailAddress,
      validator: emailValidator,
      obscureText: false,
      style: style,
      controller: emailInputController,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Email",
          labelText: "Email",
          prefixIcon: Icon(Icons.email),
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );
    final passwordField = TextFormField(
      keyboardType: TextInputType.text,
      validator: pwdValidator,
      obscureText: true,
      style: style,
      controller: pwdInputController,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Password",
          prefixIcon: Icon(Icons.lock),
          labelText: "Password",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );
    final confirmPasswordField = TextFormField(
      keyboardType: TextInputType.text,
      obscureText: true,
      style: style,
      controller: confirmPwdInputController,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Confirm Password",
          prefixIcon: Icon(Icons.lock_outline),
          labelText: "Confirm Password",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
      validator: (value) {
        if (value != pwdInputController.text) {
          return "Passwords do not match";
        }
        return null;
      },
    );
    final loginButon = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Color(0xff01A0C7),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          signUp();
        },
        child: Text("Register",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text("SignUp Page"),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          SingleChildScrollView(
            child: Center(
              child: Container(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                          height: 55.0,
                        ),
                        nameField,
                        SizedBox(height: 25.0),
                        emailField,
                        SizedBox(height: 25.0),
                        passwordField,
                        SizedBox(height: 25.0),
                        confirmPasswordField,
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
