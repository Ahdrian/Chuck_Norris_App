import 'package:adrian_chuck_norris_app/Services/chuckJokesApiService.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'chuckJokeCategoriesList.dart';
import 'chuckJokeScreen.dart';

class HomeScreen extends StatelessWidget {
  final String title;
  HomeScreen({Key key, this.title}) : super(key: key);

  final _chuckJokesApiService = new ChuckJokesApiService();
  final double _elevation = 3.5;
  final Color _raisedBtnColor = Colors.deepOrange;
  final Color _raisedBtnTextColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Container(
          padding: EdgeInsets.all(25),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                    image: AssetImage(
                        "assets/chucknorris_logo_coloured_small.png")),
                SizedBox(height: 30),
                RaisedButton(
                  elevation: _elevation,
                  color: _raisedBtnColor,
                  splashColor: Colors.white.withOpacity(0.7),
                  textColor: _raisedBtnTextColor,
                  onPressed: () async {
                    var randomChuckJoke =
                        await _chuckJokesApiService.getRandomJoke();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              ChuckJokeScreen(randomChuckJoke)),
                    );
                  },
                  child: Container(
                      padding: EdgeInsets.all(25),
                      child: Text("Show random joke")),
                ),
                SizedBox(
                  height: 20,
                ),
                RaisedButton(
                  elevation: _elevation,
                  color: _raisedBtnColor,
                  splashColor: Colors.white.withOpacity(0.7),
                  textColor: _raisedBtnTextColor,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ChuckJokeCategoriesScreen(
                              title: "Chuck categories")),
                    );
                  },
                  child: Container(
                      padding: EdgeInsets.all(25),
                      child: Text("Choose by category",
                          style: TextStyle(
                            fontSize: 14,
                          ))),
                ),
              ],
            ),
          ),
        ));
  }
}
