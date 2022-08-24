import 'package:flutter/material.dart';
import 'package:flutter_firebase/api_client.dart';
import 'package:flutter_firebase/models/user_model.dart';

class UserResultScreen extends StatefulWidget {
  const UserResultScreen({Key? key}) : super(key: key);

  @override
  State<UserResultScreen> createState() => _UserResultScreenState();
}

class _UserResultScreenState extends State<UserResultScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        centerTitle: true,
        title: const Text('User Result Screen',style: TextStyle(color: Colors.black),),
      ),
      body: FutureBuilder<List<UserModel>>(
        future: ApiClient().getAllUsers(),
        builder: (context,snapshot){
          if(snapshot.hasData){
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 20.0),
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: snapshot.data!.length,
                itemBuilder: (context ,index){
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10.0),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      decoration: BoxDecoration(
                        color: Colors.purple,
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 20.0),
                            child: CircleAvatar(
                              radius: 20.0,
                              child: Icon(Icons.person,color: Colors.white,),
                            ),
                          ),
                          Text('User Id : ${snapshot.data![index].userId}'),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10.0),
                            child: Text('Email : ${snapshot.data![index].email}'),
                          ),
                          Text('Name : ${snapshot.data![index].name}'),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20.0),
                            child: Text('Phone No : ${snapshot.data![index].phoneNo}'),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            );
          }else {
            return const Center(child: CircularProgressIndicator(color: Colors.blue,));
          }
        },
      ),
    );
  }
}
