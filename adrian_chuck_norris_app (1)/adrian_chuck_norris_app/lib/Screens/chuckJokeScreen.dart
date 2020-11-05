import 'package:adrian_chuck_norris_app/Models/chuckJoke.dart';
import 'package:adrian_chuck_norris_app/Services/chuckJokesApiService.dart';
import 'package:adrian_chuck_norris_app/Widgets/circularSpinnerWidget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// Denne widget er laget for å vise frem en enkelt vits og kan gjenbrukes i hele appen.
class ChuckJokeScreen extends StatefulWidget {
  ChuckJoke _chuckJoke;
  String category;
  ChuckJokeScreen(this._chuckJoke, {this.category});

  @override
  _ChuckJokeScreenState createState() => _ChuckJokeScreenState(_chuckJoke, category);
}

class _ChuckJokeScreenState extends State<ChuckJokeScreen> {
  ChuckJoke _chuckJoke;
  String _category;
  bool _loadingJoke = false;

  _ChuckJokeScreenState(this._chuckJoke, [this._category]);

  final _chuckJokesApiService = new ChuckJokesApiService();
  final _dateTimeFormat = new DateFormat("dd.MM.yyyy HH:mm");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Category: ${_category ?? "none"}"),
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(20, 200, 20, 20),
        child: Center(
          child: Column(
            children: [
              // GUI for å vise vitsen, vitsen er i _chuckJoke objektet:
              _loadingJoke
                  ? CircularSpinnerWidget("Loading new joke, please wait...")
                  : Card(
                elevation: 10,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    ListTile(
                      leading: Image.network(_chuckJoke.iconUrl),
                      title: Text(_chuckJoke.jokeText, style: TextStyle(fontSize: 15)),
                      subtitle: Text("Dato: ${_dateTimeFormat.format(_chuckJoke.createdAt)}"),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // Last inn ny vits:

          setState(() {
            _loadingJoke = true;
            _chuckJoke.jokeText = "Loading new joke...";
          });

          ChuckJoke newJoke;
          if (_category == null || _category.length <= 0) {
            newJoke = await _chuckJokesApiService.getRandomJoke();
          } else {
            newJoke = await _chuckJokesApiService.getRandomJokeInCategory(_category);
          }

          setState(() {
            _chuckJoke = newJoke;
            _loadingJoke = false;
          });
        },
        child: Icon(Icons.refresh),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
