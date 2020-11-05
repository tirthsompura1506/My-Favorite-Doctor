import 'package:flutter/material.dart';
import 'package:login_app/screens/main_drawer.dart';

class HomeScreen extends StatelessWidget {

  static const routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: new AppBar(
            title: new Text(
              'Home',
              style: new TextStyle(
                color: Colors.white,
              ),
            ),
            actions: <Widget>[
              IconButton(icon: Icon(Icons.add_alert_rounded), color: Colors.white,onPressed: (){},)
            ],
            //centerTitle: true,
            backgroundColor: Colors.blueGrey,
          ),
          drawer: MainDrawer(),
          backgroundColor: Colors.white,
          body: Card(
              margin: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          FlatButton.icon(onPressed: () {}, icon: Icon(Icons.add), label: Text('Add')),
                          SizedBox(width: 15.0),
                          Text(
                            'WELCOME',
                            style: TextStyle(
                              fontSize: 18.0,
                              color: Colors.blueGrey,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 15.0),
                          FlatButton.icon(onPressed: () {}, icon: Icon(Icons.delete), label: Text('Delete')),
                        ],
                      ),
                    ),
          ),
    );
  }
}
