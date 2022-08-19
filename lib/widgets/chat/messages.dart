import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shrey_chat/widgets/chat/message_bubble.dart';

class Messages extends StatelessWidget {
  const Messages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final forAuth = FirebaseAuth.instance.currentUser;
    return FutureBuilder(
      future: FirebaseAuth.instance.currentUser,
      builder: (context, futureSnapshot) {
        if (futureSnapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        return StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection('chat')
                .orderBy('time', descending: true)
                .snapshots(),
            builder: (ctx, chatSnapShot) {
              if (chatSnapShot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              final chatDocs = chatSnapShot.data?.docs;

              return ListView.builder(
                  reverse: true,
                  itemCount: chatDocs?.length,
                  itemBuilder: (ctx, index) => MessageBubble(
                        chatDocs![index]['text'],
                        chatDocs[index]['userId'] == futureSnapshot.data!.uid,
                      ));
            });
      },
    );
  }
}
