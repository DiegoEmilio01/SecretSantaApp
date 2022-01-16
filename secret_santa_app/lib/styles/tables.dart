import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Expanded(child: Container(
        alignment: Alignment.center,
        height: 60.0,
        margin: const EdgeInsets.all(0),
        decoration: BoxDecoration(
          color: Colors.deepPurple,
          border: Border.all(color: Colors.white, width: 1.5)
        ),
        child: const Text("Nombre", style: TextStyle(color: Colors.white, fontSize: 20)),
      ),),
      Expanded(child: Container(
        alignment: Alignment.center,
        height: 60.0,
        margin: const EdgeInsets.all(0),
        decoration: BoxDecoration(
          color: Colors.deepPurple,
          border: Border.all(color: Colors.white, width: 1.5)
        ),
        child: const Text("Correo", style: TextStyle(color: Colors.white, fontSize: 20)),
      ),),
    ],);
  }
}