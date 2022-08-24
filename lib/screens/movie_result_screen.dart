import 'package:flutter/material.dart';
import 'package:flutter_firebase/api_client.dart';
import 'package:flutter_firebase/models/movie_model.dart';

class MovieResultScreen extends StatefulWidget {
  const MovieResultScreen({Key? key}) : super(key: key);

  @override
  State<MovieResultScreen> createState() => _MoiveResultScreenState();
}

class _MoiveResultScreenState extends State<MovieResultScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        centerTitle: true,
        title: const Text('Movie Result Screen',style: TextStyle(color: Colors.black),),
      ),
      body: FutureBuilder<List<MovieModel>>(
        future: ApiClient().getMovieData(),
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
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20.0),
                            child: Text('IMDB ID : ${snapshot.data![index].imdbID}'),
                          ),
                          Image.network(snapshot.data![index].poster,height: 100,width: 100,),
                          Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: Text('Title : ${snapshot.data![index].title}'),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20.0),
                            child: Text('Year : ${snapshot.data![index].year}'),
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
