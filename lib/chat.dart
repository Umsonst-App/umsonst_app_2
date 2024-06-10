import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'main.dart';

// For the testing purposes, you should probably use https://pub.dev/packages/uuid
String randomString() {
  final random = Random.secure();
  final values = List<int>.generate(16, (i) => random.nextInt(255));
  return base64UrlEncode(values);
}

class MyChatSelectWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   return ListView(
             children: <Widget>[           ListTile(
            leading: Image.asset('assets/images/photo_2021-07-15_22-49-51.jpg'),
            title: Text('Chris Gerber'),
            subtitle: Text('Music by Julie Gable. Lyrics by Sidney Stein.'),
            trailing:         IconButton(
          icon: const Icon(Icons.send),
          tooltip: 'Chat mit Chris',
          onPressed: () { Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const MyChatWidget()),
            );},
        ),),
        ],
      );
  }

}

class MyChatWidget extends StatefulWidget {
  const MyChatWidget({Key? key}) : super(key: key);

  @override
  _MyChatWidgetState createState() => _MyChatWidgetState();
}

class _MyChatWidgetState extends State<MyChatWidget> {
  List<types.Message> _messages = [];
  final _user = const types.User(id: '06c33e8b-e835-4736-80f4-63f44b66666c');

  void _addMessage(types.Message message) {
    setState(() {
      _messages.insert(0, message);
    });
  }

  void _handleSendPressed(types.PartialText message) {
    final textMessage = types.TextMessage(
      author: _user,
      createdAt: DateTime.now().millisecondsSinceEpoch,
      id: randomString(),
      text: message.text,
    );

    _addMessage(textMessage);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Second Route"),
      ),
      body:Chat(
          messages: _messages,
          onSendPressed: _handleSendPressed,
          user: _user,
    ),);
  }
}