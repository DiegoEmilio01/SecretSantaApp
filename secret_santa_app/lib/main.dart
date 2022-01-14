import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:secret_santa_app/models/api_model.dart';
import 'package:secret_santa_app/pages/algorithms.dart';
import 'package:secret_santa_app/styles/inputs.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<ApiModel>(lazy: false, create: (_) => ApiModel()),
      ],
      child: const MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SECRET SANTA APP',
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: const MyHomePage(title: 'SECRET SANTA APP'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  String algorithmDropdownValue = "random";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurpleAccent,
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title, style: const TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              AlgorithmDropdown(
                info: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const Algorithms())),
                dropdownValue: algorithmDropdownValue,
                list: const [["random", "Aleatorio"], ["circle", "Circular"]],
                onChanged: (String? newValue) => setState(() {
                  algorithmDropdownValue = newValue!;
                  Provider.of<ApiModel>(context, listen: false).updateAlgorithm(newValue);
                }),
              ),
              MessageInput(
                onChanged: (newValue) => {Provider.of<ApiModel>(context, listen: false).updateMessage(newValue)},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
