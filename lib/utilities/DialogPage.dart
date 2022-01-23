import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gym_app/Providers/DBDayProvider.dart';
import 'package:flutter_gym_app/models/day.dart';
import 'package:provider/provider.dart';

class CustomeDialog {
  static showMyDialog(context, Day day) async {
    int remove;
    showDialog(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Alert !!'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Are you sure you want to remove this training ?'),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('yes'),
              onPressed: () async {
                await context.read<DBDayProvider>().deleteDay(day);
                Navigator.of(context).pop();
              },
            ),
            FlatButton(
              child: Text('No'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
  
}
