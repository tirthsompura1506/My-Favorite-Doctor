import 'package:flutter/material.dart';
import 'package:login_app/screens/main_drawer.dart';
//import 'package:url_launcher/url_launcher.dart';

class ContactScreen extends StatelessWidget {

  static const routeName = '/contact';

  // _launchURL() async {
  //   const url = 'https://flutter.dev';
  //   if (await canLaunch(url)) {
  //     await launch(url);
  //   } else {
  //     throw 'Could not launch $url';
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text(
          'Contact',
          style: new TextStyle(
            color: Colors.white,
          ),
        ),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.add_alert_rounded), color: Colors.white,onPressed: (){},)
        ],
        backgroundColor: Colors.blueGrey,
      ),
      drawer: MainDrawer(),
      backgroundColor: Colors.white,

      body: ListView(
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: <Color>[
                Colors.blueGrey,
                Colors.grey[500],
              ]),
            ),
            child: Container(
              child: Column(
                children: <Widget>[
                  Material(
                    borderRadius: BorderRadius.all(Radius.circular(50.0)),
                    elevation: 10,
                    child: Padding(padding: EdgeInsets.all(3.0),
                      child: Image.asset(
                        'asset/logo.png', width: 80, height: 80,),
                    ),
                  ),
                  SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 1.0),
                      child: Text(
                        'Take control of your health today!',
                        style: TextStyle(color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          RaisedButton(
            onPressed: () {},
            color: Colors.white,
            child: Padding(
              padding: EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Icon(
                    Icons.person,
                    color: Colors.black,
                  ),
                  SizedBox(width: 30.0,),
                  Text(
                    'My Favorite Doctor',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueGrey[700],
                    ),
                  ),
                ],
              ),
            ),
          ),

          RaisedButton(
            onPressed: (){}, //_launchURL
            color: Colors.white,
            child: Padding(
              padding: EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Icon(
                    Icons.mail,
                    color: Colors.black,
                  ),
                  SizedBox(width: 30.0,),
                  Text(
                    '@myfev.doc@gmail.com',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueGrey[700],
                    ),
                  ),
                ],
              ),
            ),
          ),

          RaisedButton(
            onPressed: (){},
            color: Colors.white,
            child: Padding(
              padding: EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Icon(
                    Icons.phone,
                    color: Colors.black,
                  ),
                  SizedBox(width: 30.0,),
                  Text(
                    '+91-12345 67890',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueGrey[700],
                    ),
                  ),
                ],
              ),
            ),
          ),

          RaisedButton(
            onPressed: () {},
            color: Colors.white,
            child: Padding(
              padding: EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Icon(
                    Icons.location_on,
                    color: Colors.black,
                  ),
                  SizedBox(width: 30.0,),
                  Text(
                    'B-204, 2nd Flor, opposit Murti\nRestaurants,Ahmedabad-(325-568).',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueGrey[700],
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




