import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

import '../../../domain/models/user.dart';
import '../../../domain/services/user_service.dart';
import '../../../utils/general_helper.dart';

class HomeViewModel extends ChangeNotifier {
  final UserService _userService;
  List<User> _users = [];

  List<User> get users => _users;

  HomeViewModel(this._userService);

  Future<void> fetchUsers(BuildContext context) async {
    try {
      _users = await _userService.getUsers();
      notifyListeners();
    } catch (e) {
      GeneralHelper.handleException(context, e as Exception);
    }
  }
}
