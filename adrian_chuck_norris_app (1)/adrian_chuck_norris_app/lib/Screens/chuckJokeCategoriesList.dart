import 'package:adrian_chuck_norris_app/Services/chuckJokesApiService.dart';
import 'package:adrian_chuck_norris_app/Widgets/circularSpinnerWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'chuckJokeScreen.dart';

class ChuckJokeCategoriesScreen extends StatelessWidget {
  final String title;
  ChuckJokeCategoriesScreen({Key key, this.title}) : super(key: key);

  final _chuckJokesApiService = new ChuckJokesApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: FutureBuilder<List<String>>(
          future: _chuckJokesApiService.getCategories(), // Henter kategorier fra API-et her
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              // Når dataen er ferdig lastet fra API-et, får vi de i categories listen:
              var categories = snapshot.data;

              return ListView.separated(
                padding: const EdgeInsets.all(25),
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () async {
                      var curCategory = categories[index]; // Brukeren har valgt denne kategorien
                      var randomChuckJokeFromCategory = await _chuckJokesApiService.getRandomJokeInCategory(curCategory);

                      // Led brukeren til selve vits siden:
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ChuckJokeScreen(randomChuckJokeFromCategory, category: curCategory)),
                      );
                    },
                    // leading: Icon(Icons.adjust),
                    title: Text('${categories[index]}'),
                    // subtitle: Text('${categories[index]}'),
                    focusColor: Colors.blue.withAlpha(30),
                  );
                  // return InkWell(
                  //   splashColor: Colors.blue.withAlpha(30),
                  //   onTap: () async {
                  //     var curCategory = categories[index]; // Brukeren har valgt denne kategorien
                  //     var randomChuckJokeFromCategory = await _chuckJokesApiService.getRandomJokeInCategory(curCategory);
                  //
                  //     // Led brukeren til selve vits siden:
                  //     Navigator.push(
                  //       context,
                  //       MaterialPageRoute(builder: (context) => ChuckJokeScreen(randomChuckJokeFromCategory)),
                  //     );
                  //   },
                  //   child: Container(
                  //     decoration: BoxDecoration(
                  //         color: Colors.white,
                  //         borderRadius: BorderRadius.all(Radius.circular(4.0)),
                  //         boxShadow: [
                  //           BoxShadow(
                  //               color: Colors.grey[300],
                  //               blurRadius: 6.0,
                  //               spreadRadius: 2.0
                  //           )
                  //         ]
                  //     ),
                  //     child: Center(
                  //         child: Container(
                  //             padding: EdgeInsets.all(15),
                  //             child: Text('${categories[index]}')
                  //         )
                  //     ),
                  //   ),
                  // );
                },
                separatorBuilder: (context, index) {
                  return const Divider();
                },
              );
            }
            // Vis en spinner mens vi venter på lasting av kategorier:
            return CircularSpinnerWidget("Laster inn kategorier, vennligst vent...");
          }
      )
    );
  }
}



