import 'package:flutter/material.dart';


class AlgorithmDropdown extends StatelessWidget {
  const AlgorithmDropdown({Key? key, required this.info, required this.dropdownValue, required this.list, required this.onChanged}) : super(key: key);
  final String dropdownValue;
  final List<List<String>> list;
  final void Function(String?) onChanged;
  final void Function()? info;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 30, 20, 15),
      child: Column(children: <Widget>[
        Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
          //const SizedBox(width: 30.0),
          const Text("Algoritmo", style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold)),
          IconButton(
            padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 5.0),
            constraints: const BoxConstraints(),
            iconSize: 20.0,
            icon: const Icon(Icons.help_outline, color: Colors.white),
            onPressed: info,
          ),
        ]),
        const SizedBox(height: 15),
        const Text("Elige qué algoritmo quieres que se utilice para generar el sorteo.", style: TextStyle(fontSize: 16, color: Colors.white)),
        const SizedBox(height: 10),
        DropdownButton<String>(
          value: dropdownValue,
          iconSize: 32,
          elevation: 16,
          isExpanded: true,
          dropdownColor: Colors.deepPurple,
          style: const TextStyle(color: Colors.white),
          underline: Container(height: 2, color: Colors.deepPurple),
          onChanged: onChanged,
          items: list.map<DropdownMenuItem<String>>((List<String> value) {
            return DropdownMenuItem<String>(
              value: value[0],
              child: Center(child: Text(value[1], style: const TextStyle(fontSize: 18))),
            );
          }).toList(),
        )],
      ),
    );
  }
}

class MessageInput extends StatelessWidget {
  const MessageInput({Key? key, required this.controller, required this.onChanged}) : super(key: key);
  final TextEditingController controller;
  final Function(String) onChanged;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
      child: Column(children: <Widget>[
        const Text("Mensaje", style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold)),
        const SizedBox(height: 15),
        const Text("Escribe qué mensaje deseas enviarle a los participantes. Usa XX para indicar quién envía e YY para indicar quién recibe (serán reemplazados por el texto correcto).", style: TextStyle(fontSize: 16, color: Colors.white)),
        const SizedBox(height: 15),
        Container(
          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.deepPurple, width: 1.5,),
            borderRadius: BorderRadius.circular(15),
          ),
          child: TextFormField(
            controller: controller,
            minLines: 2,
            maxLines: 5,
            keyboardType: TextInputType.multiline,
            style: const TextStyle(color: Colors.white, fontSize: 18),
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.all(3),
              filled: false,
              border: InputBorder.none,
              hintText: "Estimad@ XX, te ha tocado YY. ¡Compra un buen regalo!",
              hintStyle: TextStyle(color: Colors.white),
            ),
            onChanged: onChanged,
          ),
        ),
    ]));
  }
}

class InputText extends StatelessWidget {
  const InputText({Key? key, this.text="", required this.onChanged}) : super(key: key);
  final String text;
  final Function(String) onChanged;
  @override
  Widget build(BuildContext context) {
    return Expanded(child: Container(
      alignment: Alignment.center,
      height: 60.0,
      margin: const EdgeInsets.all(0),
      decoration: BoxDecoration(
        color: Colors.deepPurpleAccent,
        border: Border.all(color: Colors.white, width: 1.5)
      ),
      child: TextField(
        controller: TextEditingController(text: text),
        style: const TextStyle(color: Colors.white, fontSize: 18),
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.all(8),
          filled: false,
          border: InputBorder.none,
        ),
        onChanged: onChanged,
      ),
    ));
  }
}