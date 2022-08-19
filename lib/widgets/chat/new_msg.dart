import 'package:flutter/material.dart';

class NewMessage extends StatefulWidget {
  const NewMessage({Key? key}) : super(key: key);

  @override
  State<NewMessage> createState() => _NewMessageState();
}

class _NewMessageState extends State<NewMessage> {
  var _enteredMsg='';

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 8),
        padding: EdgeInsets.all(8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Expanded(child: TextField(
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
              onPressed:_enteredMsg.isEmpty ? null : (){

              },)
          ],
        )
    );
  }
}
