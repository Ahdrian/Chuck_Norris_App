import 'package:adrian_chuck_norris_app/Models/chuckJoke.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'dart:convert';
import 'dart:async';

import '../Models/customException.dart';

class ChuckJokesApiService {
  final String _baseUrl = "https://api.chucknorris.io";

  Future<dynamic> _get(String url) async {
    var responseJson;
    try {
      final response = await http.get(_baseUrl + url);
      responseJson = _response(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  Future<List<String>> getCategories() async {
    var res = await _get("/jokes/categories");

    List<String> categories = new List<String>(res.length);
    for (var i = 0; i < res.length; i++) {
      var cat = res[i] as String;
      categories[i] = cat;
    }
    return categories;
  }

  Future<ChuckJoke> getRandomJoke() async {
    var res = await _get("/jokes/random");
    var chuckJoke = ChuckJoke.fromJson(res);
    return chuckJoke;
  }

  Future<ChuckJoke> getRandomJokeInCategory(String category) async {
    var res = await _get("/jokes/random?category=$category");
    var chuckJoke = ChuckJoke.fromJson(res);
    return chuckJoke;
  }


  dynamic _response(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.body.toString());
        print(responseJson);
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:

      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:

      default:
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}