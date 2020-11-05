import 'package:adrian_chuck_norris_app/Screens/chuckJokeScreen.dart';
import 'package:adrian_chuck_norris_app/Services/chuckJokesApiService.dart';
import 'package:flutter/material.dart';

class ChuckRaisedButtonWidget extends StatelessWidget {

  String _buttonText;
  ChuckRaisedButtonWidget(this._buttonText);

  final double _elevation = 3.5;
  final Color _raisedBtnColor = Colors.white;
  final Color _raisedBtnTextColor = Colors.deepOrange;

  final _chuckJokesApiService = new ChuckJokesApiService();

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
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
          child: Text(_buttonText)
      ),
    );
  }
}
