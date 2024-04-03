import 'package:talent_tourney/domain/models/user.dart';
import '../../domain/repositories/user_repository.dart';
import '../data_sources/remote/firebase/firebase_user_data_source.dart';

class UserRepositoryImpl implements UserRepository {
  final FirebaseUserDataSource _firebaseUserDataSource;

  UserRepositoryImpl(this._firebaseUserDataSource);

  @override
  Future<List<User>> getUsers() async {
    return await _firebaseUserDataSource.getUsers();
  }
}
