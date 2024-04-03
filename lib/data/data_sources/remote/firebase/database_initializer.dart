// ignore_for_file: unused_local_variable

import 'package:cloud_firestore/cloud_firestore.dart';

// Export the initializeDatabase function These function will be used to create Dummy Data and for testing that
export 'database_initializer.dart';

Future<void> initializeDatabase() async {
  try {
    // Get document references for each collection
    final skillsCollection = FirebaseFirestore.instance.collection('Skills');
    final skillLevelsCollection =
        FirebaseFirestore.instance.collection('SkillLevels');
    final usersCollection = FirebaseFirestore.instance.collection('Users');
    final userSkillLevelsCollection =
        FirebaseFirestore.instance.collection('UserSkillLevels');
    final battlesCollection = FirebaseFirestore.instance.collection('Battles');
    final battleTypesCollection =
        FirebaseFirestore.instance.collection('BattleTypes');
    final ratingsCollection = FirebaseFirestore.instance.collection('Ratings');
    final pointTransfersCollection =
        FirebaseFirestore.instance.collection('PointTransfers');
    final achievementsCollection =
        FirebaseFirestore.instance.collection('Achievements');
    final interactionsCollection =
        FirebaseFirestore.instance.collection('Interactions');
    final performancesCollection =
        FirebaseFirestore.instance.collection('Performances');
    final battleHistoryCollection =
        FirebaseFirestore.instance.collection('BattleHistory');
    final pointSourcesCollection =
        FirebaseFirestore.instance.collection('PointSources');
    final pointActivitiesCollection =
        FirebaseFirestore.instance.collection('PointActivities');
    final pointsEarnedCollection =
        FirebaseFirestore.instance.collection('PointsEarned');

    // Insert records into Skills table
    await insertIfNotExists(skillsCollection, 'skill1', {
      'skill_name': 'Rapping',
    });

    await insertIfNotExists(skillsCollection, 'skill2', {
      'skill_name': 'Sketching',
    });

    await insertIfNotExists(skillsCollection, 'skill3', {
      'skill_name': 'Live Drawing',
    });

    await insertIfNotExists(skillsCollection, 'skill4', {
      'skill_name': 'Coding',
    });

    await insertIfNotExists(skillsCollection, 'skill5', {
      'skill_name': 'Artwork',
    });

    // Insert records into SkillLevels table
    await insertIfNotExists(skillLevelsCollection, 'skilllevel1', {
      'skilllevel_name': 'Rising Star',
      'point_threshold': 0,
    });

    await insertIfNotExists(skillLevelsCollection, 'skilllevel2', {
      'skilllevel_name': 'Skillful Prodigy',
      'point_threshold': 1000,
    });

    await insertIfNotExists(skillLevelsCollection, 'skilllevel3', {
      'skilllevel_name': 'Elite Maestro',
      'point_threshold': 4000,
    });

    await insertIfNotExists(skillLevelsCollection, 'skilllevel4', {
      'skilllevel_name': 'Master Virtuoso',
      'point_threshold': 16000,
    });

    await insertIfNotExists(skillLevelsCollection, 'skilllevel5', {
      'skilllevel_name': 'Legendary Icon',
      'point_threshold': 64000,
    });

    // Insert records into Users table
    await insertIfNotExists(usersCollection, 'user1', {
      'username': 'JohnDoe',
      'email': 'john@example.com',
      'password': 'password123',
      'city': 'New York',
      'state': 'NY',
      'country': 'USA',
      'skill_id': 2,
      'level': 'Skillful Prodigy',
      'points': 1200,
    });

    await insertIfNotExists(usersCollection, 'user2', {
      'username': 'JaneSmith',
      'email': 'jane@example.com',
      'password': 'pass456',
      'city': 'Los Angeles',
      'state': 'CA',
      'country': 'USA',
      'skill_id': 1,
      'level': 'Rising Star',
      'points': 800,
    });

    await insertIfNotExists(usersCollection, 'user3', {
      'username': 'MikeJohnson',
      'email': 'mike@example.com',
      'password': 'secret',
      'city': 'London',
      'state': null,
      'country': 'UK',
      'skill_id': 4,
      'level': 'Master Virtuoso',
      'points': 17500,
    });

    // Insert records into UserSkillLevels table
    await insertIfNotExists(userSkillLevelsCollection, 'usl1', {
      'user_id': 1,
      'skilllevel_id': 2,
      'points_earned': 200,
      'ranking_position': 1,
    });

    await insertIfNotExists(userSkillLevelsCollection, 'usl2', {
      'user_id': 2,
      'skilllevel_id': 1,
      'points_earned': 75,
      'ranking_position': 2,
    });

    await insertIfNotExists(userSkillLevelsCollection, 'usl3', {
      'user_id': 3,
      'skilllevel_id': 3,
      'points_earned': 1000,
      'ranking_position': 1,
    });

    // Insert records into Battles table
    await insertIfNotExists(battlesCollection, 'battle1', {
      'challenging_user_id': 1,
      'challenged_user_id': 2,
      'battle_datetime':
          Timestamp.fromDate(DateTime.parse('2023-06-23 10:00:00')),
      'outcome': 'Win',
    });

    await insertIfNotExists(battlesCollection, 'battle2', {
      'challenging_user_id': 3,
      'challenged_user_id': 1,
      'battle_datetime':
          Timestamp.fromDate(DateTime.parse('2023-06-24 14:30:00')),
      'outcome': 'Loss',
    });

    // Insert records into BattleTypes table
    await insertIfNotExists(battleTypesCollection, 'battletype1', {
      'battle_type_name': 'Rap Battle',
    });

    await insertIfNotExists(battleTypesCollection, 'battletype2', {
      'battle_type_name': 'Art Challenge',
    });

    // Insert records into Ratings table
    await insertIfNotExists(ratingsCollection, 'rating1', {
      'user_id': 1,
      'battle_id': 1,
      'rating_score': 4,
    });

    await insertIfNotExists(ratingsCollection, 'rating2', {
      'user_id': 2,
      'battle_id': 1,
      'rating_score': 3,
    });

    await insertIfNotExists(ratingsCollection, 'rating3', {
      'user_id': 3,
      'battle_id': 2,
      'rating_score': 5,
    });

    // Insert records into PointTransfers table
    await insertIfNotExists(pointTransfersCollection, 'pointtransfer1', {
      'from_user_id': 1,
      'to_user_id': 2,
      'transferred_points': 50,
    });

    await insertIfNotExists(pointTransfersCollection, 'pointtransfer2', {
      'from_user_id': 3,
      'to_user_id': 1,
      'transferred_points': 100,
    });

    // Insert records into Achievements table
    await insertIfNotExists(achievementsCollection, 'achievement1', {
      'user_id': 1,
      'achievement_name': 'Master of Sketching',
      'achievement_details': 'Awarded for exceptional sketching skills',
      'date_achieved': Timestamp.fromDate(DateTime.parse('2023-06-20')),
    });

    await insertIfNotExists(achievementsCollection, 'achievement2', {
      'user_id': 3,
      'achievement_name': 'Coding Champion',
      'achievement_details': 'Recognized for outstanding coding abilities',
      'date_achieved': Timestamp.fromDate(DateTime.parse('2023-06-25')),
    });

    // Insert records into Interactions table
    await insertIfNotExists(interactionsCollection, 'interaction1', {
      'user_id': 1,
      'interaction_type': 'Like',
    });

    await insertIfNotExists(interactionsCollection, 'interaction2', {
      'user_id': 2,
      'interaction_type': 'Comment',
    });

    await insertIfNotExists(interactionsCollection, 'interaction3', {
      'user_id': 3,
      'interaction_type': 'Follow',
    });

    // Insert records into Performances table
    await insertIfNotExists(performancesCollection, 'performance1', {
      'user_id': 1,
      'performance_name': 'Live Drawing Showcase',
      'performance_date': Timestamp.fromDate(DateTime.parse('2023-06-18')),
      'performance_details': 'Presented a live drawing session to an audience',
    });

    await insertIfNotExists(performancesCollection, 'performance2', {
      'user_id': 3,
      'performance_name': 'Rap Battle Finals',
      'performance_date': Timestamp.fromDate(DateTime.parse('2023-06-26')),
      'performance_details':
          'Competed in the city-wide rap battle championship',
    });

    // Insert records into BattleHistory table
    await insertIfNotExists(battleHistoryCollection, 'battlehistory1', {
      'battle_id': 1,
      'performance_id': 1,
    });

    await insertIfNotExists(battleHistoryCollection, 'battlehistory2', {
      'battle_id': 2,
      'performance_id': 2,
    });

    // Insert records into PointSources table
    await insertIfNotExists(pointSourcesCollection, 'pointsource1', {
      'source_name': 'Daily Login',
    });

    await insertIfNotExists(pointSourcesCollection, 'pointsource2', {
      'source_name': 'Achievement Unlock',
    });

    await insertIfNotExists(pointSourcesCollection, 'pointsource3', {
      'source_name': 'Friend Referral',
    });

    // Insert records into PointActivities table
    await insertIfNotExists(pointActivitiesCollection, 'pointactivity1', {
      'activity_name': 'Upvote',
    });

    await insertIfNotExists(pointActivitiesCollection, 'pointactivity2', {
      'activity_name': 'Comment',
    });

    await insertIfNotExists(pointActivitiesCollection, 'pointactivity3', {
      'activity_name': 'Share',
    });

    // Insert records into PointsEarned table
    await insertIfNotExists(pointsEarnedCollection, 'pointsearned1', {
      'user_id': 1,
      'source_id': 1,
      'activity_id': 1,
      'points_earned': 10,
    });

    await insertIfNotExists(pointsEarnedCollection, 'pointsearned2', {
      'user_id': 2,
      'source_id': 2,
      'activity_id': 3,
      'points_earned': 20,
    });

    await insertIfNotExists(pointsEarnedCollection, 'pointsearned3', {
      'user_id': 3,
      'source_id': 3,
      'activity_id': 2,
      'points_earned': 15,
    });

    print('Initialization completed successfully!');
  } catch (e) {
    print('Initialization failed: $e');
  }
}

Future<void> insertIfNotExists(CollectionReference collection,
    String documentId, Map<String, dynamic> data) async {
  final document = collection.doc(documentId);
  final snapshot = await document.get();
  if (!snapshot.exists) {
    await document.set(data);
    print('Document $documentId created successfully.');
  } else {
    print('Document $documentId already exists. Skipped creation.');
  }
}
