import 'package:flutter/material.dart';
import 'package:triiapp/data/repositories/local_repository.dart';

class AppBloc extends ChangeNotifier {
  LocalRepository _localRepository = LocalRepository();
  String _user;

  String get user => this._user;

  void validateUser() async {
    _user = await _localRepository.getUser();
    notifyListeners();
  }

  void saveUser(String name) async {
    _localRepository.setUser(name);
    _user = name;
    notifyListeners();
  }
}
