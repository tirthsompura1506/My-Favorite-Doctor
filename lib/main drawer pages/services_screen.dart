import 'package:flutter/material.dart';
import 'package:login_app/screens/main_drawer.dart';

class ServicesScreen extends StatefulWidget {

  static const routeName = '/services';

  @override
  _ServicesScreenState createState() => _ServicesScreenState();
}

class _ServicesScreenState extends State<ServicesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text(
          'Services',
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
      body: Container(
        child: Services(),
      ),
    );
  }
}

class Services extends StatefulWidget {
  @override
  _ServicesState createState() => _ServicesState();
}

class _ServicesState extends State<Services> {
  final list_item = [
    {'name' : 'Dermatologist','pic' : 'asset/dermatologist.jpg'},
    {'name' : 'Cardiothoracic','pic' : 'asset/cardiothoracic.jpg'},
    {'name' : 'Gynecologist','pic' : 'asset/gynecologist.jpg'},
    {'name' : 'Orthopedic','pic' : 'asset/orthopedic.jpg'},
    {'name' : 'Neurologist','pic' : 'asset/1Neurologist.jpg'},
  ];
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: list_item.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index){
        return Service(
          Services_name: list_item[index]['name'],
          Services_pic: list_item[index]['pic'],
        );
        });
  }
}

class Service extends StatelessWidget {
  final Services_name;
  final Services_pic;


  Service(
      {this.Services_name,
        this.Services_pic,});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Hero(
          tag: new Text("Heroes"),
          child: Material(
            child: InkWell(
              onTap: (){},
              child: GridTile(
                footer: Container(
                  color: Colors.black54,
                  height: 50,
                  child: ListTile(
                    leading: Text(Services_name, style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 18),),
                  ),
                ),
                child: Image.asset(Services_pic,fit: BoxFit.cover,),
              ),
            ),
          ),
      ),
    );
  }
}


