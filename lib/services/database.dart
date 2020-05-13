import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:magulab_flutter/models/request.dart';
import 'package:magulab_flutter/models/user.dart';
import 'package:magulab_flutter/models/match.dart';
import 'package:logger/logger.dart';

enum Collection { users, sales, requests, matches }

const Map<Collection, String> CollectionIds = {
  Collection.users: 'users',
  Collection.sales: 'sales',
  Collection.requests: 'requests',
  Collection.matches: 'matches',
};
const Map<Collection, String> DocumentIds = {
  Collection.users: 'user/',
  Collection.sales: 'sale/',
  Collection.requests: 'request/',
  Collection.matches: 'match/',
};

class DatabaseService with ChangeNotifier {
  final Firestore firestore = Firestore.instance;
  final Logger logger = Logger();
  // User signedInUser;
  User signedInUser = User(
      id: "no2Gx4CMtKdHw1gyeUi0DbaFfY02",
      name: "김진우",
      email: "gudnams@gmail.com"); // TODO JSTEST 개발 편의를 위해 로그인 정보 하드코딩

  Future<void> updateUserData(String id, String name, String email) async {
    signedInUser = await getUser(id);
    if (signedInUser != null) {
      return firestore
          .collection(CollectionIds[Collection.users])
          .document("${DocumentIds[Collection.users]}$id")
          .updateData({
        'name': name,
        'email': email,
        'updatedAt': DateTime.now(),
      });
    } else {
      return firestore
          .collection(CollectionIds[Collection.users])
          .document("${DocumentIds[Collection.users]}$id")
          .setData({
        'id': id,
        'name': name,
        'email': email,
        'createdAt': DateTime.now(),
        'updatedAt': DateTime.now(),
      });
    }
  }

  Stream<List<Map<String, dynamic>>> users(Firestore firestore) {
    return firestore
        .collection('users')
        .snapshots()
        .map((data) => data.documents.map((doc) => doc.data).toList());
  }

  Future<User> getUser(String id) async {
    Map<String, dynamic> userData = await firestore
        .collection(CollectionIds[Collection.users])
        .document("${DocumentIds[Collection.users]}$id")
        .get()
        .then((ds) => ds.data);
    if (userData != null)
      return User(
          id: userData['id'], name: userData['name'], email: userData['email']);
    else
      return null;
  }

  Future<Map<String, dynamic>> getRequestsData() async {
    Map<String, dynamic> requestsData = await firestore
        .collection(CollectionIds[Collection.requests])
        .document("${DocumentIds[Collection.requests]}${signedInUser.id}")
        .get()
        .then((ds) => ds.data);

    return requestsData;
  }

  Future<Map<String, dynamic>> getMatchesData() async {
    Map<String, dynamic> matchesData = await firestore
        .collection(CollectionIds[Collection.matches])
        .document("${DocumentIds[Collection.matches]}${signedInUser.id}")
        .get()
        .then((ds) => ds.data);

    return matchesData;
  }
}
