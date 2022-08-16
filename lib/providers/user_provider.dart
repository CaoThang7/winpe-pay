import 'package:flutter/widgets.dart';
import 'package:winpe_pay/models/user.dart';
import 'package:winpe_pay/resources/auth_methods.dart';

class UserProvider with ChangeNotifier {
  User? _user;

  User? get user => _user;
  final AuthMethods _authMethods = AuthMethods();

  void setUser(var user) {
    _user = User.fromJson(user);
    notifyListeners();
  }
}
