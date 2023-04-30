import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:innovecture/Pages/Dashboard/model/movieslist_model.dart';

class ApiHandler {
  callMoviesListApi() async {
    try {
      http.Response response = await http
          .get(Uri.parse("https://www.episodate.com/api/most-popular?page=1"));
      if (response.statusCode == 200) {
        var json = jsonDecode(response.body);
        return MoviesModel.fromJson(json);
      }
    } on SocketException catch (e) {
      return e;
    }
  }

  searchMoviesListApi(searchKey) async {
    try {
      http.Response response = await http.get(Uri.parse(
          "https://www.episodate.com/api/search?q=$searchKey&page=1"));
      if (response.statusCode == 200) {
        var json = jsonDecode(response.body);
        return MoviesModel.fromJson(json);
      }
    } on SocketException catch (e) {
      return e;
    }
  }
}
