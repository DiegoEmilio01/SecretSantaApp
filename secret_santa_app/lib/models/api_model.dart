import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiModel extends ChangeNotifier {
  String algorithm = "random";
  String message = "";
  List<List<String>> users = [["", ""], ["", ""]];
  var parsedUsers = [];

  void updateAlgorithm(newAlgorithm) {
    algorithm = newAlgorithm;
  }

  void updateMessage(newMessage) {
    message = newMessage;
  }

  void updateUsername(id, username) {
    users[id][0] = username;
  }

  void updateEmail(id, email) {
    users[id][1] = email;
  }

  void addUser() {
    if (users.length < 25) users.add(["", ""]);
  }

  void deleteUser() {
    if (users.length > 2) users.removeLast();
  }

  Future<bool> sendToApi() async {
    if (message == "") return false;
    parsedUsers = [];
    for (List<String> user in users) {
      if (user[0] == "" || user[1] == "") return false;
      parsedUsers.add({"username": user[0], "email": user[1]});
    }
    final response = await http.post(
      Uri.parse("https://amigo-secreto-api.herokuapp.com/"),
      headers: <String, String>{
        "Content-Type": "application/json",
        "Accept": "application/json",
      },
      body: jsonEncode(<String, dynamic>{
        "method": algorithm,
        "message": message,
        "users": parsedUsers,
      }),
    );
    if (json.decode(response.body)["success"] == true){
      algorithm = "random";
      message = "";
      users = [["", ""], ["", ""]];
      return true;
    } else {
      return false;
    }
  }
}