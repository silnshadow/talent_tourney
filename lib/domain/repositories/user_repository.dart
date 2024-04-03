import 'package:talent_tourney/domain/models/user.dart';

abstract class UserRepository {
  Future<List<User>> getUsers();
}
