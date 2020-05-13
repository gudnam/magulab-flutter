import 'dart:convert';

import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:logger/logger.dart';
import 'package:magulab_flutter/models/user.dart';
import 'package:http/http.dart' as http;

import 'database.dart';

Logger logger = Logger();

class FirebaseProvider with ChangeNotifier {
  final FirebaseAuth fAuth = FirebaseAuth.instance; // Firebase 인증 플러그인의 인스턴스
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  FirebaseUser firebaseUser;

  String _lastFirebaseResponse = ""; // Firebase로부터 받은 최신 메시지(에러 처리용)

  String baseUrl = "http://10.0.2.2:5001/magulab/us-central1/";
  // String baseUrl = "https://us-central1-magulab.cloudfunctions.net/";

  FirebaseProvider() {
    _prepareUser();
  }

  void setFirebaseUser(FirebaseUser firebaseUser) {
    this.firebaseUser = firebaseUser;
    notifyListeners();
  }

  FirebaseUser getFirebaseUser() {
    return firebaseUser;
  }

  // 최근 Firebase에 로그인한 사용자의 정보 획득
  _prepareUser() {
    fAuth.currentUser().then((FirebaseUser currentUser) {
      setFirebaseUser(currentUser);
      // check if local db
      // else
      signInOrSignUpToServer(currentUser);
    });
  }

  // 구글 계정을 이용하여 Firebase에 로그인
  Future<bool> signInWithGoogleAccount() async {
    try {
      final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.getCredential(
          accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);
      final FirebaseUser user =
          (await fAuth.signInWithCredential(credential)).user;
      assert(user.email != null);
      assert(user.displayName != null);
      assert(!user.isAnonymous);
      assert(await user.getIdToken() != null);

      final FirebaseUser currentUser = await fAuth.currentUser();
      assert(user.uid == currentUser.uid);

      await signInOrSignUpToServer(currentUser)
          .then((_) => setFirebaseUser(user))
          .catchError((e) {
        throw new Exception(e.toString());
      });

      return true;
    } on Exception catch (e) {
      logger.e(e.toString());
      setLastFBMessage(e.toString());
      return false;
    }
  }

  // Firebase로부터 로그아웃
  signOut() async {
    await fAuth.signOut();
    setFirebaseUser(null);
  }

  // Firebase로부터 회원 탈퇴
  withdrawalAccount() async {
    await firebaseUser.delete();
    setFirebaseUser(null);
  }

  // Firebase로부터 수신한 메시지 설정
  setLastFBMessage(String msg) {
    _lastFirebaseResponse = msg;
  }

  // Firebase로부터 수신한 메시지를 반환하고 삭제
  getLastFBMessage() {
    String returnValue = _lastFirebaseResponse;
    _lastFirebaseResponse = null;
    return returnValue;
  }

  Future<User> signInOrSignUpToServer(FirebaseUser user) async {
    User signedInUser;
    await getUserInfoFromServer(user.uid)
        .then((value) => signedInUser = value)
        .catchError((e) async {
      if (e == 404) {
        await signUpToServer(user)
            .then((value) => signedInUser = value)
            .catchError((e) {
          throw (e);
        });
      } else {
        throw ('네트워크 문제가 발생하였습니다.');
      }
    });
    return signedInUser;
  }

  Future<User> signUpToServer(FirebaseUser user) async {
    User createdUser;
    await createUserToServer(user)
        .then((value) => createdUser = value)
        .catchError((e) {
      if (e == 400) {
        throw ('사용자 생성에 실패하였습니다.');
      }
      return createdUser;
    });
  }

  Future<User> getUserInfoFromServer(String key) async {
    String url = baseUrl + "userInfo";
    var response = await http.get(url, headers: {'authorization': key});
    if (response.statusCode == 200) {
      User user = User.fromJson(jsonDecode(response.body));
      return user;
    } else {
      throw (response.statusCode);
    }
  }

  Future<User> createUserToServer(FirebaseUser user) async {
    String url = baseUrl + "userInfo";
    var response = await http.post(url, body: {
      'uid': user.uid,
      'name': user.displayName,
      'email': user.email,
    });
    if (response.statusCode == 201) {
      User user = User.fromJson(jsonDecode(response.body));
      return user;
    } else {
      throw (response.statusCode);
    }
  }
}
