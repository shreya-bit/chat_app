import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  //const MessageBubble({Key? key}) : super(key: key);
  MessageBubble(this.message,this.isMe);
  final String message;
  //final String userId;
  final bool isMe;

  @override
  Widget build(BuildContext context) {
    return Row(
      //crossAxisAlignment: CrossAxisAlignment.end,
      children:  <Widget>[
        Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
            borderRadius: BorderRadius.circular(20),
          ),
          width: 140,
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          margin: EdgeInsets.symmetric(vertical: 5, horizontal: 8),
          child: Text(message,
              style: TextStyle(color: Theme.of(context).colorScheme.onSecondary)),
        )
      ],
    );
  }
}
