import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:login_app/screens/home_screen.dart';
import 'package:login_app/screens/login_screen.dart';
import 'package:login_app/screens/singup_screen.dart';
import 'package:login_app/main drawer pages/about_screen.dart';
import 'package:login_app/main drawer pages/services_screen.dart';
import 'package:login_app/main drawer pages/contact_screen.dart';
import 'package:login_app/main drawer pages/profile_screen.dart';
import 'package:login_app/screens/main_drawer.dart';
import 'models/authentication.dart';
import 'package:login_app/splash_screen.dart';

void main() =>runApp (MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers:[
        ChangeNotifierProvider.value(
            value:Authentication()
        ),
      ],
      child: MaterialApp(
          title: 'Login App',
          theme: ThemeData(
            primaryColor: Colors.blue,
          ),
          home: SplashScreen(),
          routes: {
            ProfileScreen.routeName: (ctx)=> ProfileScreen(),
            ContactScreen.routeName: (ctx)=> ContactScreen(), //may be baki
            ServicesScreen.routeName: (ctx)=> ServicesScreen(), //baki
            AboutScreen.routeName: (ctx)=> AboutScreen(), //May be done
            MainDrawer.routeName: (ctx)=> MainDrawer(),
            SingupScreen.routeName: (ctx)=> SingupScreen(),
            LoginScreen.routeName: (ctx)=> LoginScreen(),
            HomeScreen.routeName: (ctx)=> HomeScreen(), //baki
            SplashScreen.routeName:(ctx)=> SplashScreen(),//may be half
          },
      ),
    );
  }
}


