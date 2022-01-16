import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:secret_santa_app/models/api_model.dart';
import 'package:secret_santa_app/pages/algorithms.dart';
import 'package:secret_santa_app/styles/inputs.dart';
import 'package:secret_santa_app/styles/tables.dart';
import 'package:secret_santa_app/styles/buttons.dart';

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
      home: const HomePage(title: 'SECRET SANTA APP'),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

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
                list: const [["random", "Aleatorio"], ["one_circle", "Circular"]],
                onChanged: (String? newValue) => setState(() {
                  algorithmDropdownValue = newValue!;
                  Provider.of<ApiModel>(context, listen: false).updateAlgorithm(newValue);
                }),
              ),
              MessageInput(
                onChanged: (newValue) => {Provider.of<ApiModel>(context, listen: false).updateMessage(newValue)},
              ),
              const SizedBox(height: 15),
              const Text("Participantes", style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold)),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                child: Container(
                  alignment: Alignment.centerRight,
                  child: Column(children: <Widget>[
                    const Header(),
                    ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: Provider.of<ApiModel>(context, listen: false).users.length,
                      shrinkWrap: true,
                      primary: false,
                      itemBuilder: (context, index) => Row(children: [
                        InputText(
                          text: Provider.of<ApiModel>(context, listen: false).users[index][0],
                          onChanged: (enteredUsername){
                            Provider.of<ApiModel>(context, listen: false).updateUsername(index, enteredUsername);
                          },
                        ),
                        InputText(
                          text: Provider.of<ApiModel>(context, listen: false).users[index][1],
                          onChanged: (enteredEmail){
                            Provider.of<ApiModel>(context, listen: false).updateEmail(index, enteredEmail);
                          },
                        ),
                      ],),
                    ),
                ],),),
              ),
              Buttons(
                addFunction: (){
                  Provider.of<ApiModel>(context, listen: false).addUser();
                  setState(() {});
                },
                removeFunction: (){
                  Provider.of<ApiModel>(context, listen: false).deleteUser();
                  setState(() {});
                },
              ),
              SendButton(
                onClick: (){
                  setState(() {});
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
