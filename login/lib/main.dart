import 'package:flutter/material.dart';

void main() => runApp(LoginApp());

class LoginApp extends StatefulWidget {
  @override
  _LoginAppState createState() => _LoginAppState();
}

class _LoginAppState extends State<LoginApp> {

  bool _isCheck = false;
  String _Username = "";
  String _Password = "";
  String _info = "";

  void getCheckData(bool value) {
    setState(() {
      _isCheck = value;
    });
  }

  void getUserName(String text) {
    setState(() {
      _Username = text;
    });
  }

  void getPass(String text) {
    setState(() {
      _Password = text;
    });
  }

  void getInfo() {
    setState(() {
      if (_isCheck) {
        if (_Password != "" && _Username != "") {
          _info = "@Username: " + _Username + " " + ".@Password: " + _Password;
        } else {
          _info = "not yet";
        }
      } else {
        _info = "You are not yet anree?";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
     return MaterialApp(
       debugShowCheckedModeBanner: false,
       home: Scaffold(
         appBar: AppBar(
            title: Text("Login"),
            centerTitle: true,
         ),

         body: Column(
           children: <Widget>[
              Container(
                padding: EdgeInsets.all(20.0),
                   child: TextField(
                      decoration: InputDecoration(
                         icon: Icon(Icons.person),
                          hintText: 'Username',
                      ),
                          onChanged: (String text) {
                          getUserName(text);
                  }),
            ),

              Container(
                 padding: EdgeInsets.all(10.0),
                    child: TextField(
                        decoration: InputDecoration(
                           icon: Icon(Icons.lock),
                               hintText: 'Password',
                        ),
                        onChanged: (String text) {
                            getPass(text);
                        },
                        autofocus: false,
                        obscureText: true,
                )),

              Container(
                padding: EdgeInsets.only(left: 120.0),
                   child: Row(
                      children: <Widget>[
                         Checkbox(
                            value: _isCheck,
                               onChanged: (bool value) {
                                   getCheckData(value);
                              },
                         ),
                         Text("Are you agree ?"),
                      ],
                    ),
            ),
            Container(
              width: 300.0,
              child: RaisedButton(
                  onPressed: () {
                       getInfo();
                  },
                  child: Text("Login", style: TextStyle(color: Colors.white),),
                  color: Colors.blue,
              ),
            ),

            Container(
               padding: EdgeInsets.only(top: 15.0),
               child: RaisedButton(
                  onPressed: () {},
                  child: Text("" + _info),
                  color: Colors.white,
               ),
            ),
           ],
         ),
       ),
     );
   }
 }
