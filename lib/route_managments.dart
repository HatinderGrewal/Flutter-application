import 'package:flutter/material.dart';
import 'package:flutter_firebase/app_constants.dart';
import 'package:flutter_firebase/screens/home_screen.dart';
import 'package:flutter_firebase/screens/login_screen.dart';
import 'package:flutter_firebase/screens/movie_result_screen.dart';
import 'package:flutter_firebase/screens/product_result_screen.dart';
import 'package:flutter_firebase/screens/signup_screen.dart';
import 'package:flutter_firebase/screens/user_result_screen.dart';

class RouteManagement{
  static Map<String,Widget Function(BuildContext)> router (){
    return {
      kLoginScreenRoute : (context)=> const LoginScreen(),
      kSignUpScreenRoute : (context)=> const SignUpScreen(),
      kHomeScreenRoute : (context)=> const HomeScreen(),
      kProductResultScreenRoute : (context)=> const ProductResultScreen(),
      kUserProfileScreenRoute : (context)=> const UserResultScreen(),
      kMovieResultScreenRoute : (context)=> const MovieResultScreen(),
    };
  }
}