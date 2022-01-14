import 'package:flutter/material.dart';


class ApiModel extends ChangeNotifier{
  String algorithm = "random";
  String message = "Estimad@ XX, te ha tocado YY. ¡Compra un buen regalo!";

  void updateAlgorithm(newAlgorithm) {
    algorithm = newAlgorithm;
    print(algorithm);
  }

  void updateMessage(newMessage) {
    message = newMessage;
    print(message);
  }
}