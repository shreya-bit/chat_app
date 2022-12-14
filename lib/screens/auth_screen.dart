import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shrey_chat/widgets/auth/auth_form.dart';
import 'package:firebase_auth/firebase_auth.dart';
class AuthScreen extends StatefulWidget {
  //const AuthScreen({Key? key}) : super(key: key);
  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _auth= FirebaseAuth.instance;
  void _submitAuthForm(
      String email,
      String password,
      String username,
      bool isLogin,
      BuildContext ctx)
        async {
            UserCredential authResult;

           try{
             if(isLogin){
               authResult=await _auth.signInWithEmailAndPassword(email: email, password: password);
             }
             else{
               authResult= await _auth.createUserWithEmailAndPassword(email: email, password: password);

               await FirebaseFirestore.instance.collection('users').doc(authResult.user?.uid).set({
                 'username':username,
                 'email':email,
                 'uid':authResult.user?.uid
               });

             }
           } on PlatformException catch (error){
             String? message="An error occurred, please check your credentials";

             if(error.message!=null){
               message=error.message;
             }

             ScaffoldMessenger.of(ctx).showSnackBar(
                  SnackBar(content: Text(message!),
                  backgroundColor: Theme.of(context).errorColor,)
             );

           } catch (err){
             print(err);
           }
          }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: AuthForm(_submitAuthForm));
  }
}
