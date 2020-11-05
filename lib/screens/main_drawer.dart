import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'package:login_app/main drawer pages/about_screen.dart';
import 'package:login_app/main drawer pages/services_screen.dart';
import 'package:login_app/main drawer pages/contact_screen.dart';
import 'package:login_app/main drawer pages/profile_screen.dart';

class MainDrawer extends StatelessWidget {

  static const routeName = '/maindrawer';

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
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
                    child:  Padding(padding:EdgeInsets.all(3.0),
                      child: Image.asset('asset/logo.png',width: 80,height: 80,),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0.0,10.0,0.0,1.0),
                    child: Text(
                      'My Favorite Doctor',
                      style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
                    ),
                  ),
                    Text(
                      '"Take control of your health today!"',
                    style: TextStyle(color: Colors.white),
                    ),
                ],
              ),
            ),
          ),
          CustomList(Icons.person,
                  ()=>{Navigator.of(context).pushReplacementNamed(ProfileScreen.routeName)},
              'Profile'
          ),
          CustomList(Icons.add_box_rounded,()=>{},'Appointment'),
          CustomList(
              Icons.work_outlined,
                  ()=>{Navigator.of(context).pushReplacementNamed(ServicesScreen.routeName)},
              'Services'
          ),
          CustomList(
              Icons.account_box_sharp,
                  ()=>{Navigator.of(context).pushReplacementNamed(ContactScreen.routeName)},
              'Contact US'
          ),
          CustomList(
              Icons.announcement_sharp,
                  ()=>{Navigator.of(context).pushReplacementNamed(AboutScreen.routeName)},
              'About Us'
          ),

          CustomList(
              Icons.lock,
                  ()=>{Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (c) => LoginScreen()),
                      (r) => false)},
              'Log Out'
          ),

        ],
      ),
    );
  }
}

class CustomList extends StatelessWidget{

  IconData icon;
  String text;
  Function onTap;

  CustomList(this.icon,this.onTap,this.text);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 0.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.grey.shade400)),
        ),
        child: InkWell(
          splashColor: Colors.blueGrey[200],
          onTap: onTap,
          child: Container(
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Icon(icon),
                    Padding(
                    padding: const EdgeInsets.all(12.0),
                      child: Text(text, style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold,color: Colors.blueGrey[700]),),
                    ),
                  ],
                ),
                Icon(Icons.arrow_right),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
