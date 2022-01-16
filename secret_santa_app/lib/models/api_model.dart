import 'package:flutter/material.dart';


class ApiModel extends ChangeNotifier{
  String algorithm = "random";
  String message = "";
  List<List<String>> users = [["", ""], ["", ""]];

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
}