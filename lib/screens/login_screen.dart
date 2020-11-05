import 'package:flutter/material.dart';
import 'package:login_app/screens/singup_screen.dart';
import 'package:provider/provider.dart';
import '../models/authentication.dart';
import 'home_screen.dart';
import 'main_drawer.dart';


class LoginScreen extends StatefulWidget {
  static const routeName = '/login';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formkey = GlobalKey();

  Map<String, String> _authData = {
    'email' : '',
    'password' : ''

  };

  void _showErrorDialog(String msg)
  {
    showDialog(
        context: context,
      builder: (ctx) => AlertDialog(
        title: Text('An Error Occured'),
            content: Text(msg),
        actions: <Widget>[
          FlatButton(
              onPressed: () {
                Navigator.of(ctx).pop();
              },
              child: Text('Okay')
          ),
        ],
      ),
    );
  }
  Future <void> _submit() async
  {
    if(!_formkey.currentState.validate())
      {
        return;
      }
    _formkey.currentState.save();

    try{
      await Provider.of<Authentication>(context, listen: false).logIn(
          _authData['email'],
          _authData['password']
      );

      Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
    }catch(error)
    {
      var errorMessage = 'Authentication Failed. Please try again later.';
      _showErrorDialog(errorMessage);
    }
  }

//back button  or alert box.
  // Future<bool> _onbackpressed(){
  //   return showDialog(
  //       context: context,
  //       builder: (context) => AlertDialog(
  //         title: Text(
  //             'Do you want to exit?'
  //         ),
  //         actions: <Widget>[
  //           FlatButton(
  //             child: Text('No'),
  //             onPressed: () => Navigator.pop(context, false),
  //           ),
  //           FlatButton(
  //             child: Text('Yes'),
  //             onPressed: () => Navigator.pop(context, true),
  //           ),
  //         ],
  //       )
  //   );
  // }

  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //screen no ups and down
      resizeToAvoidBottomPadding: false,
            appBar:AppBar(
              title: Text(
                'LOGIN',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              backgroundColor: Colors.blueGrey,

              actions: <Widget>[
                FlatButton(
                textColor: Colors.white,
                    onPressed: (){
                  Navigator.of(context).pushReplacementNamed(SingupScreen.routeName);
                    },
                    child: Row(
                      children: <Widget>[
                        Text(
                          'Singup',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                          ),
                        ),

                        Icon(Icons.person_add),
                      ],
                  ),
                ),
              ],
            ),
            //drawer: MainDrawer(),
            body: Stack(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.grey,
                        Colors.blueGrey,
                      ],
                    ),
                  ),
                ),

                Center(
                  child: SingleChildScrollView( //screen is slide ups and down
                      child: Card(
                        shape:RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),

                        child: Container(
                          height: 300,
                          width: 300,
                          padding: EdgeInsets.all(16),
                          child: Form(
                            key: _formkey,
                            child: SingleChildScrollView(
                              child: Column(
                                children: <Widget>[
                                  Text(
                                      'PLEASE LOGIN HERE !!',
                                    style: TextStyle(
                                      color: Colors.blueGrey,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.0,
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                  SizedBox(height: 10.0),

                                  //Email
                                  TextFormField(
                                    decoration: InputDecoration(labelText: 'Email'
                                      ,hintText: 'Email',
                                      focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: Colors.blueGrey),
                                    ),
                                    ),
                                    keyboardType: TextInputType.emailAddress,
                                    validator: (value)
                                      {
                                        if(value.isEmpty || !value.contains('@'))
                                          {
                                            return 'Invalid Email';
                                          }
                                        return null;
                                      },
                                      onSaved: (value)
                                      {
                                        _authData['email'] = value;
                                      },
                                  ),

                                  //Password
                                  TextFormField(
                                    obscureText: _obscureText,
                                    decoration: InputDecoration(
                                      labelText: 'Password',
                                      hintText: 'Password',
                                      suffix: IconButton(icon: Icon(_obscureText ? Icons.visibility : Icons.visibility_off),onPressed: (){
                                        setState(() {
                                          _obscureText = !_obscureText;
                                        });
                                      },),
                                      focusedBorder: UnderlineInputBorder
                                        (
                                        borderSide: BorderSide(color: Colors.blueGrey)
                                      ),
                                    ),

                                      validator: (value)
                                      {
                                        if(value.isEmpty || value.length<=5)
                                          {
                                            return 'Invalid Password ';
                                          }
                                        return null;
                                      },
                                    onSaved: (value)
                                      {
                                        _authData['password'] = value;
                                      },
                                      //obscureText: true,
                                  ),
                                  SizedBox(height: 30.0),
                                  RaisedButton(
                                    child: Text(
                                      'LOGIN'
                                    ),
                                    onPressed: () {
                                      _submit();
                                    },
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    color: Colors.blueGrey,
                                    textColor: Colors.white,
                                  ),
                                ],
                              ),
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

