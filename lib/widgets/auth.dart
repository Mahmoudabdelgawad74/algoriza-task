import 'package:algoriza_task/widgets/button.dart';
import 'package:flutter/material.dart';

enum AuthType {
  register,
  login,
}

class Auth extends StatefulWidget {
  final AuthType authType;

  const Auth({Key key, @required this.authType}) : super(key: key);

  @override
  _AuthState createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  final _formKey = GlobalKey<FormState>();
  String _email = '', _password = '';

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.lightBlue,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Form(
        key: _formKey,
        child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
              child: Column(
                children: <Widget>[
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Enter your email',
                      hintText: 'ex: test@gmail.com',
                    ),
                    onChanged: (value) {
                      _email = value;
                    },
                    validator: (value) =>
                        value.isEmpty ? 'You must enter a valid email' : null,
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Enter your password',
                    ),
                    obscureText: true,
                    onChanged: (value) {
                      _password = value;
                    },
                    validator: (value) => value.length <= 6
                        ? 'Your password must be larger than 6 characters'
                        : null,
                  ),
                  SizedBox(height: 20),
                  Button(
                    text: widget.authType == AuthType.login ? 'LOGIN' : 'REGISTER',
                    color: Colors.brown,
                    textColor: Colors.white,
                    onPressed: () async {
                      if (_formKey.currentState.validate()) {
                        if (widget.authType == AuthType.login) {
                          Navigator.of(context).pushReplacementNamed('home');
                        } else {
                          Navigator.of(context).pushReplacementNamed('home');
                        }
//                  print(_email);
//                  print(_password);
                      }
                    },
                  ),
                  SizedBox(height: 6),
                  FlatButton(
                    onPressed: () {
                      if (widget.authType == AuthType.login) {
                        Navigator.of(context).pushReplacementNamed('register');
                        print(widget.authType);
                      } else {
                        Navigator.of(context).pushReplacementNamed('login');
                      }
                    },
                    child: Text(
                      widget.authType == AuthType.login
                          ? 'Don\'t have an account?'
                          : 'Already have an account?',
                      style: TextStyle(fontSize: 18, color: Colors.black54),
                    ),
                  ),
                ],
              ),
        ),
      ),
            ],
          ),
    );
  }
}
