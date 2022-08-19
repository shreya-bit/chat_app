import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class NewMessage extends StatefulWidget {
  const NewMessage({Key? key}) : super(key: key);

  @override
  State<NewMessage> createState() => _NewMessageState();
}

class _NewMessageState extends State<NewMessage> {
  var _enteredMsg='';
  final controller= new TextEditingController();
  void _sendMessage()async{
    FocusScope.of(context).unfocus();
    final user=await FirebaseAuth.instance.currentUser!;
    FirebaseFirestore.instance.collection('chat').add({
      'text':_enteredMsg,
      'time': Timestamp.now(),
      'userId': user.uid,
    });
    controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        //margin: EdgeInsets.only(top: 8),
      //height: 20,
        padding: EdgeInsets.all(8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Expanded(child: TextField(
              controller: controller,
              decoration: InputDecoration(labelText: 'Send a msg'),
              onChanged: (value) {
                  setState(() {
                    _enteredMsg=value;
                  });
              },
            ),
            ),
            IconButton(
              color: Theme
                  .of(context)
                  .primaryColor,
              icon: Icon(Icons.send, size: 30,),
              onPressed:_enteredMsg.isEmpty ? null : _sendMessage,)
          ],
        )
    );
  }
}
