import '../models/user.dart';
import '../repositories/user_repository.dart';

class UserService {
  final UserRepository _userRepository;

  UserService(this._userRepository);

  Future<List<User>> getUsers() async {
    return await _userRepository.getUsers();
  }
}
