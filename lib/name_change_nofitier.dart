import 'package:flutter/cupertino.dart';

class NameChangeNofifier extends ChangeNotifier {
  String _name = "name";
  String get name => _name;

  set name(String value) {
    _name = value;
    notifyListeners();
  }
}
