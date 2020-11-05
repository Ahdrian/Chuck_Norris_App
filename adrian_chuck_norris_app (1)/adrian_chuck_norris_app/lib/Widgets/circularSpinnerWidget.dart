import 'package:flutter/material.dart';

class CircularSpinnerWidget extends StatelessWidget {

  CircularSpinnerWidget(this._title);
  final String _title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(35),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Column(
                children: [
                  Text(_title, style: TextStyle(color: Theme.of(context).primaryColor, fontSize: Theme.of(context).textTheme.headline5.fontSize)),
                  Padding(
                    padding: const EdgeInsets.only(top: 25.0),
                    child: CircularProgressIndicator(),
                  ),
                ],
              ),
            ),
          ]
      ),
    );
  }
}
