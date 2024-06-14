
import 'package:flutter/material.dart';
import 'package:my_first_app/auth/welcome.dart';

import 'auth/sign_in.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter TextField Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),

      home: SignIn(),
    );
  }
}

