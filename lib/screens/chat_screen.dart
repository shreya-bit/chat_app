import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shrey_chat/widgets/chat/messages.dart';
import 'package:shrey_chat/widgets/chat/new_msg.dart';
class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ShreyChat'),
      actions: [
        DropdownButton(icon: Icon(Icons.more_vert,
        color: Theme.of(context).primaryIconTheme.color,),
        items:[
          DropdownMenuItem(child: Container(
            child: Row(
              children: <Widget>[
                Icon(Icons.exit_to_app),
                SizedBox(width: 8,),
                Text('Logout'),
              ],
            )
          ),
          value:'logout'),
        ],
        onChanged: (itemIdentifier){
          if(itemIdentifier=='logout'){
            FirebaseAuth.instance.signOut();
          }
        },
        )
      ],),

      body:Container(
       // height: MediaQuery.of(context).size.height-300,
        child:Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: const <Widget>[
            Expanded(child: Messages(),),
            Expanded(flex: 0, child: NewMessage())
          ],
        )
      ) ,
    );
  }
}

