

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:StreamBuilder<QuerySnapshot>(
          stream: Firestore.instance.collection('chats/TVZ2brPUZ4BlKL1KstJx/messages/')
          .snapshots(),
          builder: (context, streamSnapshot){
            return ListView.builder(
              itemBuilder:(context, index)=>
              Container(
                padding:const EdgeInsets.all(10),
                child: const Text("works"),
              ),
              itemCount: streamSnapshot.data?.documents.length, );},),

      floatingActionButton:FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: (){


        },
      ) ,
    );
  }
}

