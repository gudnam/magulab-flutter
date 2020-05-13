import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter/material.dart';
import 'package:magulab_flutter/services/firebase_provider.dart';
import 'package:provider/provider.dart';

import 'pages/wrapper.dart';

void main() async {
  // CloudFunctions.instance.useFunctionsEmulator(origin: 'http://localhost:5001');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => FirebaseProvider()),
      ],
      child: MaterialApp(
        title: "살림",
        home: WrapperPage(),
      ),
    );
  }
}
