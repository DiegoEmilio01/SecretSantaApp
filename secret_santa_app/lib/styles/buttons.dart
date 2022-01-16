import 'package:flutter/material.dart';

class Buttons extends StatelessWidget {
  const Buttons({Key? key, required this.addFunction, required this.removeFunction}) : super(key: key);
  final void Function()? addFunction;
  final void Function()? removeFunction;
  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.fromLTRB(20, 5, 20, 15),
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        IconButton(
          padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 5.0),
          constraints: const BoxConstraints(),
          iconSize: 40.0,
          icon: const Icon(Icons.remove_circle_outline, color: Colors.white),
          onPressed: removeFunction,
        ),
        IconButton(
          padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 5.0),
          constraints: const BoxConstraints(),
          iconSize: 40.0,
          icon: const Icon(Icons.add_circle_outline, color: Colors.white),
          onPressed: addFunction,
        ),
      ],),
    );
  }
}

class SendButton extends StatelessWidget {
  const SendButton({Key? key, required this.onClick}) : super(key: key);
  final void Function()? onClick;
  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.fromLTRB(20, 0, 20, 25),
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        const SizedBox(width: 9),
        IconButton(
          padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 5.0),
          constraints: const BoxConstraints(),
          iconSize: 60.0,
          icon: const Icon(Icons.outgoing_mail , color: Colors.white),
          onPressed: onClick,
        ),
      ],),
    );
  }
}