import 'package:flutter/material.dart';
import 'package:guidpro_mobile/views/auth/login.dart';
import 'package:guidpro_mobile/views/auth/signup.dart';
import 'package:guidpro_mobile/views/board.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:guidpro_mobile/views/home/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

    const MyApp({super.key});

    // This widget is the root of your application.
    @override
    Widget build(BuildContext context) {
      final storage = FlutterSecureStorage();
      return  MaterialApp( 
        title: 'Guide Pro',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Home(),
        routes: {
          '/login': (context) =>  LoginScreen(),
          '/signup': (context) =>  SignUpScreen(),
          '/home': (context) =>  Home(),
          
        },

      );
    }
}


