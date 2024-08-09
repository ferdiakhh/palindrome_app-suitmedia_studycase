import 'package:flutter/material.dart';
import '../models/user_model.dart';

class UserProvider with ChangeNotifier {
  String _selectedUserName = "Selected User Name";
  User? _selectedUser;

  String get selectedUserName => _selectedUserName;
  User? get selectedUser => _selectedUser;

  void selectUser(User user) {
    _selectedUser = user;
    _selectedUserName = '${user.firstName} ${user.lastName}';
    notifyListeners();
  }
}
