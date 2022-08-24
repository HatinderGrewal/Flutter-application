import 'package:flutter/material.dart';
import 'package:flutter_firebase/app_constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue,
        title: const Text('Home Screen',style: TextStyle(color: Colors.black),),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: GestureDetector(
              onTap: (){
                Navigator.pushNamedAndRemoveUntil(context, kLoginScreenRoute, (route) => false);
              },
              child: const Icon(Icons.logout,color: Colors.black,),
            ),
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                GestureDetector(
                  onTap: (){
                    Navigator.pushNamed(context, kProductResultScreenRoute);
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: Material(
                      elevation: 8.0,
                      borderRadius: BorderRadius.circular(20.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        alignment: Alignment.center,
                        height: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          color: Color.fromARGB(159, 0, 195, 42),
                        ),
                        child: const Text('Product Detail.',style: TextStyle(color: Colors.white,fontSize: 30.0,fontWeight: FontWeight.w400,fontStyle: FontStyle.italic),),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    Navigator.pushNamed(context, kUserProfileScreenRoute);
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: Material(
                      elevation: 8.0,
                      borderRadius: BorderRadius.circular(20.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 200,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          color: Color.fromARGB(185, 0, 138, 30),
                        ),
                        child: const Text('User Data',style: TextStyle(color: Color.fromARGB(255, 255, 255, 255),fontSize: 30.0,fontWeight: FontWeight.w400,fontStyle: FontStyle.italic),),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    Navigator.pushNamed(context, kMovieResultScreenRoute);
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: Material(
                      elevation: 8.0,
                      borderRadius: BorderRadius.circular(20.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 200,
                        alignment: Alignment.center,
                        padding: const EdgeInsets.only(top: 10.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          color: Color.fromARGB(255, 0, 92, 20)
                        ),
                        child: const Text('Watch Movies',style: TextStyle(color: Colors.white,fontSize: 30.0,fontWeight: FontWeight.w400,fontStyle: FontStyle.italic),),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void jumpToPage(){
    Navigator.pushNamed(context, kProductResultScreenRoute);
  }
}
