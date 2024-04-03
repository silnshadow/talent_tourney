import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../data/data_sources/remote/firebase/firebase_user_data_source.dart';
import '../data/repositories/user_repository_impl.dart';
import '../domain/repositories/user_repository.dart';
import '../domain/services/user_service.dart';
import '../presentation/modules/home/home_view_model.dart';

class Dependencies {
  static List<SingleChildWidget> getProviders() {
    return [
      Provider<FirebaseFirestore>(create: (_) => FirebaseFirestore.instance),
      Provider<FirebaseUserDataSource>(
        create: (context) =>
            FirebaseUserDataSource(context.read<FirebaseFirestore>()),
      ),
      Provider<UserRepository>(
        create: (context) =>
            UserRepositoryImpl(context.read<FirebaseUserDataSource>()),
      ),
      Provider<UserService>(
        create: (context) => UserService(context.read<UserRepository>()),
      ),
      ChangeNotifierProvider<HomeViewModel>(
        create: (context) => HomeViewModel(context.read<UserService>()),
      ),
    ];
  }
}
