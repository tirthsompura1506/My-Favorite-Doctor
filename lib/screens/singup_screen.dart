import 'package:flutter/material.dart';
import '../models/authentication.dart';
import '../screens/login_screen.dart';
import 'package:provider/provider.dart';

class SingupScreen extends StatefulWidget {

  static const routeName = '/singup';

  @override
  _SingupScreenState createState() => _SingupScreenState();
}

class _SingupScreenState extends State<SingupScreen> {

  final GlobalKey<FormState> _formkey = GlobalKey();
  TextEditingController _passwordController = new TextEditingController();

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
      await Provider.of<Authentication>(context, listen: false).singUp(
          _authData['email'],
          _authData['password']
      );

      Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);
    }catch(error)
    {
      var errorMessage = 'Authentication Failed. Please try again later.';
      _showErrorDialog(errorMessage);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar:AppBar(
        //centerTitle: true,
        //elevation: 0,
        title: Text(
          'SINGUP',
          style: TextStyle(
            color: Colors.white,
          ),
        ), //centerTitle: true,
        backgroundColor: Colors.blueGrey,
        actions: <Widget>[
          FlatButton(
            textColor: Colors.white,
            onPressed: (){
              Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);
            },
            child: Row(
              children: <Widget>[
                Text('Login ',
                style: TextStyle(fontWeight: FontWeight.bold,),
                ),

                Icon(Icons.person)
              ],
            ),
          ),
        ],
      ),
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                    Colors.grey,
                    Colors.blueGrey,
                  ]
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
                  height: 400,
                  width: 300,
                  padding: EdgeInsets.all(16),
                  child: Form(
                    key: _formkey,
                    child: SingleChildScrollView(
                      child: Column(
                        children: <Widget>[

                          Text(
                            'PLEASE SINGUP HERE !!',
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
                            decoration: InputDecoration(labelText: 'Email',
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
                            decoration: InputDecoration(
                              labelText: 'Password',
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.blueGrey),
                              ),
                            ),
                            obscureText: true,
                            controller: _passwordController,
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
                          ),

                          // confirm Password
                          TextFormField(
                              decoration: InputDecoration(
                                labelText: 'Confirm Password',
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.blueGrey),
                                ),
                              ),
                              obscureText: true,
                              validator: (value)
                              {
                                if(value.isEmpty || value != _passwordController.text)
                                {
                                  return 'Invalid Password ';
                                }
                                return null;
                                },
                              onSaved: (value) {},
                          ),

                          SizedBox(height: 30.0),
                          RaisedButton(
                            child: Text(
                                'SINGUP'
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