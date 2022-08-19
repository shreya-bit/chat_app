import 'package:flutter/material.dart';
import 'package:shrey_chat/screens/auth_screen.dart';
import 'package:shrey_chat/screens/chat_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    //options: FirebaseOptions.,
  );
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shrey Chat',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: StreamBuilder(stream: FirebaseAuth.instance.authStateChanges(), builder:(ctx,userSnapshot){
        if(userSnapshot.hasData){
           return ChatScreen();
        }
        return AuthScreen();
      }),
    );
  }
}
