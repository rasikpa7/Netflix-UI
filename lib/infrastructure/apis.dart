import 'dart:convert';

import 'package:netflix/presentation/downloads/models/all_data_model.dart/all_data_model.dart';
import 'package:netflix/presentation/downloads/models/data_model/data_model.dart';
import 'package:http/http.dart' as http;

import '../presentation/home/models/category/category.dart';
import '../presentation/home/models/category/genre.dart';


abstract class ApiCalls {
  Future getAllMovies();
  Future getPopular();
  Future getTrending();
  Future search(String value);
  Future categories();
}
 
class MovieDB extends ApiCalls {
  @override
  Future<List<DataModel>> getAllMovies() async {
    final result = await http.get(Uri.parse(
        "https://api.themoviedb.org/3/trending/all/day?api_key=f88b478026037712e036ac5db7fe2109"));
    Map<String, dynamic> map = json.decode(result.body);
    final data = AllDataModel.fromJson(map);
    return data.results;
  }

  @override
  Future<List<DataModel>> getPopular() async {
    final result = await http.get(Uri.parse(
        "https://api.themoviedb.org/3/movie/popular?api_key=f88b478026037712e036ac5db7fe2109&language=en-US&page=1"));
    Map<String, dynamic> map = json.decode(result.body);
    final data = AllDataModel.fromJson(map);
    return data.results;
  }

  @override
  Future<List<DataModel>> getTrending() async {
    final result = await http.get(Uri.parse(
        "https://api.themoviedb.org/3/account/{account_id}/rated/movies?api_key=f88b478026037712e036ac5db7fe2109&language=en-US&sort_by=created_at.asc&page=1"));
    Map<String, dynamic> map = json.decode(result.body);
    final data = AllDataModel.fromJson(map);
    return data.results;
  }

  @override
  Future<List<DataModel>> getTVShow() async {
    final result = await http.get(Uri.parse(
        "https://api.themoviedb.org/3/movie/upcoming?api_key=f88b478026037712e036ac5db7fe2109&language=en-US&page=1"));
    Map<String, dynamic> map = json.decode(result.body);
    final data = AllDataModel.fromJson(map);
    return data.results;
  }

  @override
  Future<List<DataModel>> getAction() async {
    final result = await http.get(Uri.parse(
        "https://api.themoviedb.org/3/movie/{movie_id}/lists?api_key=f88b478026037712e036ac5db7fe2109&language=en-US&page=1"));
    Map<String, dynamic> map = json.decode(result.body);
    final data = AllDataModel.fromJson(map);
    return data.results;
  }

  @override
  Future<List<DataModel>> search(String value) async {
    final result = await http.get(Uri.parse(
        "https://api.themoviedb.org/3/search/movie?api_key=f88b478026037712e036ac5db7fe2109&language=en-US&query=$value&page=1&include_adult=false"));
    Map<String, dynamic> map = json.decode(result.body);
    final data = AllDataModel.fromJson(map);
    return data.results;
  }
  
  @override
  Future<List<Genre>> categories() async{
     final result = await http.get(Uri.parse(
        "https://api.themoviedb.org/3/genre/movie/list?api_key=f88b478026037712e036ac5db7fe2109&language=en-US"));
    Map<String, dynamic> map = json.decode(result.body);
    final data = Category.fromJson(map);
    return data.genres!;
  }

  
}
