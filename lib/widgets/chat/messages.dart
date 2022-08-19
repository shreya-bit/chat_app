
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class Messages extends StatelessWidget {
  const Messages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream:FirebaseFirestore.instance.collection('chat').snapshots(),
      builder: (ctx,chatSnapShot){
        if(chatSnapShot.connectionState== ConnectionState.waiting){
          return Center(child: CircularProgressIndicator(),);
        }
        final chatDocs= chatSnapShot.data?.docs;

        return ListView.builder(
            itemCount: chatDocs?.length,
            itemBuilder:(ctx,index)=>Text(chatDocs![index]['text']));
      },
    );
  }
}
