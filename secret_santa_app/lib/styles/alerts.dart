import 'package:flutter/material.dart';


Future<void> textDialog(String text, context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(text),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context, 'Ok'),
            child: const Text('Ok'),
          ),
        ],
      );
    },
  );
}