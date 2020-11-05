import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_app/screens/main_drawer.dart';

class AboutScreen extends StatelessWidget {
  static const routeName = '/about';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text(
          'About',
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
      body: Center(
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: <Widget>[
                Column(children: <Widget>[
                  Column(
                    children: <Widget>[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            width: 200,
                            height: 200,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                                image: DecorationImage(image: AssetImage('asset/img.jpg'),
                                  fit:BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(height: 10),

                          Text('My Favorit Doctor',
                            style: TextStyle(
                                fontSize: 30,
                                color: Colors.black
                            ),
                          ),
                          SizedBox(height: 20),
                          Text('  Their About Us page stands out by showcasing some of their unique and creative projects Their About Us page stands out by showcasing some of their unique and creative projects.',
                            textAlign: TextAlign.justify,
                            style: TextStyle(fontSize: 15),
                          ),
                          SizedBox(height: 20),
                          Text('  Their About Us page stands out by showcasing some Their About Us page stands out by showcasing some of their unique and creative projects Their About Us page stands out by showcasing some of their unique and creative projectsof their unique and creative projects Their About Us page stands out by showcasing some of their unique and creative projects.',
                            textAlign: TextAlign.justify,
                            style: TextStyle(fontSize: 15),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Column(children: <Widget>[
                  ]),
                 ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
