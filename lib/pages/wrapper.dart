import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:magulab_flutter/services/firebase_provider.dart';
import 'package:provider/provider.dart';

import 'auth/signin.dart';
import 'home/home.dart';

Logger logger = Logger();

class WrapperPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FirebaseProvider firebaseProvider = Provider.of<FirebaseProvider>(context);
    if (firebaseProvider.getUser() != null &&
        firebaseProvider.getUser().isEmailVerified == true) {
      return HomePage();
    } else {
      return SignInPage();
    }
  }
}
