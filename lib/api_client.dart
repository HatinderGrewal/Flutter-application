import 'dart:convert';
import 'dart:developer';

import 'package:flutter_firebase/models/movie_model.dart';
import 'package:flutter_firebase/models/post_model.dart';
import 'package:flutter_firebase/models/product_model.dart';
import 'package:flutter_firebase/models/user_model.dart';
import 'package:http/http.dart';

class ApiClient{

  ApiClient._internalConstructor();

  static final ApiClient _instance = ApiClient._internalConstructor();

  factory ApiClient(){
    return _instance;
  }

  Future<List<PostModel>> getAllPost()async{
    List<PostModel> allPost = [];
    try {
      Response response = await get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
      if(response.statusCode>=200 && response.statusCode<=230){
        final result = jsonDecode(response.body);
        if(result is List){
          for(var loop in result){
            allPost.add(PostModel.fromJson(loop));
          }
        }
      }
    } catch (e) {
      log('000000000000000000000 ${e.toString()}');
    }
    return allPost;
  }

  Future<List<ProductModel>> getAllProduct()async{
    List<ProductModel> allPost = [];
    try {
      Response response = await get(Uri.parse('https://fakestoreapi.com/products'));
      if(response.statusCode>=200 && response.statusCode<=230){
        final result = jsonDecode(response.body);
        if(result is List){
          for(var loop in result){
            allPost.add(ProductModel.fromJson(loop));
          }
        }
      }
    } catch (e) {
      log('000000000000000000000 ${e.toString()}');
    }
    return allPost;
  }

  Future<List<UserModel>> getAllUsers()async{
    List<UserModel> allPost = [];
    try {
      Response response = await get(Uri.parse('https://fakestoreapi.com/users'));
      if(response.statusCode>=200 && response.statusCode<=230){
        final result = jsonDecode(response.body);
        if(result is List){
          for(var loop in result){
            allPost.add(UserModel.fromJson(loop));
          }
        }
      }
    } catch (e) {
      log('000000000000000000000 ${e.toString()}');
    }
    return allPost;
  }

  Future<List<MovieModel>> getMovieData()async{
    List<MovieModel> allPost = [];
    try {
      Response response = await get(Uri.parse('https://fake-movie-database-api.herokuapp.com/api?s=batman'));
      if(response.statusCode>=200 && response.statusCode<=230){
        final result = jsonDecode(response.body);
        var data = result['Search'];
        if(data is List){
          for(var loop in data){
            allPost.add(MovieModel.fromJson(loop));
          }
        }
      }
    } catch (e) {
      log('000000000000000000000 ${e.toString()}');
    }
    return allPost;
  }

}