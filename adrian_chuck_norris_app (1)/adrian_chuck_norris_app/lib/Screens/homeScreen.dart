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
  final Color _raisedBtnColor = Colors.white;
  final Color _raisedBtnTextColor = Colors.deepOrange;

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
            children: [
              RaisedButton(
                elevation: _elevation,
                color: _raisedBtnColor,
                splashColor: Theme.of(context).primaryColor.withOpacity(0.7),
                textColor: _raisedBtnTextColor,
                onPressed: () async {
                  var randomChuckJoke = await _chuckJokesApiService.getRandomJoke();
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ChuckJokeScreen(randomChuckJoke)),
                  );
                },
                child: Container(
                  padding: EdgeInsets.all(20),
                  child: Text("Show random joke")
                ),
              ),
              SizedBox(
                height: 10,
              ),
              RaisedButton(
                elevation: _elevation,
                color: _raisedBtnColor,
                splashColor: Theme.of(context).primaryColor.withOpacity(0.7),
                textColor: _raisedBtnTextColor,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ChuckJokeCategoriesScreen(title: "Chuck categories")),
                  );
                },
                child: Container(
                    padding: EdgeInsets.all(20),
                    child: Text("Choose by category", style: TextStyle(fontSize: 14))
                ),
              ),
            ],
          ),
        ),
      )
    );
  }
}



