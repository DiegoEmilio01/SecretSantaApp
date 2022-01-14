import 'package:flutter/material.dart';

class Algorithms extends StatelessWidget {
  const Algorithms({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ALGORITMOS',
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: Scaffold(
        backgroundColor: Colors.deepPurpleAccent,
          appBar: AppBar(
            centerTitle: true,
            title: const Text("ALGORITMOS", style: TextStyle(fontWeight: FontWeight.bold)),
          ),
        body: SingleChildScrollView(
           child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const <Widget>[
                Text("ola"),
                Text("ola"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}