import 'package:flutter/material.dart';
import 'package:login_app/screens/main_drawer.dart';


class ProfileScreen extends StatelessWidget {

  static const routeName = '/profile';
  Widget textfield({@required String hintText}){
   return Material(
     elevation: 3,
     shadowColor: Colors.blueGrey,
     shape: RoundedRectangleBorder(
       borderRadius: BorderRadius.circular(8),
     ),
     child: TextField(
       decoration: InputDecoration(
         hintText: hintText,
         hintStyle: TextStyle(letterSpacing: 2,color: Colors.black54,fontWeight: FontWeight.bold),
         fillColor: Colors.white30,
         filled: true,
         border: OutlineInputBorder(
           borderRadius: BorderRadius.circular(10.0),
           borderSide: BorderSide.none,
         )
       ),
     ),
   );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text(
          'Profile',
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
      body: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height: 370,
                  width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // TextField(
                    //   decoration: InputDecoration(
                    //     labelText: 'Username',
                    //     focusedBorder: UnderlineInputBorder(
                    //       borderSide: BorderSide(color: Colors.blueGrey),
                    //     ),
                    //   ),
                    //   keyboardType: TextInputType.text,),
                    textfield(
                      hintText: 'Username',
                    ),
                    textfield(
                      hintText: 'Email',
                    ),
                    textfield(
                      hintText: 'Number',
                    ),
                    textfield(
                      hintText: 'Address',
                    ),

                    Container(
                      height: 45,
                        width: double.infinity,
                      child: RaisedButton(
                        onPressed: (){},
                        color: Colors.blueGrey,
                        child: Center(
                          child: Text(
                              "Update",
                          style: TextStyle(fontSize: 23,color: Colors.white,),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          CustomPaint(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
            ),
            painter: HeaderCoverdContainer(),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(padding: EdgeInsets.all(20),
              child: Text(
                'Profile',
                style:TextStyle(
                    fontSize: 35,
                    letterSpacing: 1.5,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                ),
              ),
              ),
              Container(
                padding: EdgeInsets.all(10.0),
                width: MediaQuery.of(context).size.width/2,
                height: MediaQuery.of(context).size.width/2,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white,width: 5,),
                  shape: BoxShape.circle,
                  color: Colors.white,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                      image: AssetImage("asset/my.jpg")),
                ),
              ),
            ],
          ),
          Padding(padding: EdgeInsets.only(bottom: 270,left: 184,),
          child: CircleAvatar(
            backgroundColor: Colors.black54,
            child: IconButton(icon: Icon(Icons.edit,color: Colors.white,),onPressed: (){},),
          ),
          ),
        ],
      ),
    );
  }
}

class HeaderCoverdContainer extends CustomPainter{


  @override

  void paint(Canvas canvas,Size size){
    Paint paint = Paint()..color=Colors.blueGrey;
    Path path = Path()
      ..relativeLineTo(0, 150)
      ..quadraticBezierTo(size.width/2,225,size.width,150)
      ..relativeLineTo(0,-150)
      ..close();
    canvas.drawPath(path, paint);
  }
  @override
  bool shouldRepaint(CustomPainter oldDelegate)=>false;
}

