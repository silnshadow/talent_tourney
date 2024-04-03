import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../domain/models/user.dart';

class FirebaseUserDataSource {
  final FirebaseFirestore _firestore;

  FirebaseUserDataSource(this._firestore);

  Future<List<User>> getUsers() async {
    final querySnapshot = await _firestore.collection('Users').get();
    return querySnapshot.docs.map((doc) {
      final data = doc.data();
      return User(
        id: doc.id,
        username: data['username'],
        email: data['email'],
        city: data['city'],
        state: data['state'] ?? '',
        country: data['country'],
        skillId: data['skill_id'],
        level: data['level'],
        points: data['points'],
      );
    }).toList();
  }
}
