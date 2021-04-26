import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_complete_guide/chats/message.dart';
import 'package:flutter_complete_guide/chats/new_message.dart';

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Messager :D '),
        actions: [
          DropdownButton(
            icon: Icon(Icons.more_vert,
                color: Theme.of(context).primaryColorLight),
            items: [
              DropdownMenuItem(
                child: Container(
                    child: Row(children: <Widget>[
                  Icon(Icons.exit_to_app),
                  SizedBox(width: 8),
                  Text('logout')
                ])),
                value: 'logout',
              )
            ],
            onChanged: (itemIdentifer) {
              if (itemIdentifer == 'logout') {
                FirebaseAuth.instance.signOut();
              }
            },
          )
        ],
      ),
      body: Container(
        child: Column(
            children: <Widget>[Expanded(child: Messages()), NewMessage()]),
      ),
     
    );
  }
}
