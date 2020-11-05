import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'http_exception.dart';


class Authentication with ChangeNotifier
{
  Future<void> singUp(String email, String password) async
  {
    const url = 'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyBn3NwXofyafSjlVD2-XSRvpXJbi8-UWOE';
    try{
    final response = await http.post(url, body: json.encode(
      {
        'email' : email,
        'password' : password,
        'returnSecureToken' : true,
      }
    ));
    final responseDate = json.decode(response.body);
    //print(responseDate);
    if(responseDate['error'] != null)
    {
      throw HttpExeception(responseDate['error']['message']);
    }
    }catch(error)
    {
      throw error;
    }
  }

  Future<void> logIn(String email, String password) async
  {
    const url = 'https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=AIzaSyBn3NwXofyafSjlVD2-XSRvpXJbi8-UWOE';
    try{
     final response = await http.post(url, body: json.encode(
         {
           'email' : email,
           'password' : password,
           'returnSecureToken' : true,
         }
     ));
     final responseDate = json.decode(response.body);
     if(responseDate['error'] != null)
     {
       throw HttpExeception(responseDate['error']['message']);
     }
     //print(responseDate);
     }catch(error)
    {
     throw error;
    }
  }
}