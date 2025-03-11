import 'package:flutter/material.dart';
import 'package:whatspps/models/chat-model.dart';

class Chats extends StatefulWidget {
  @override
  ChatsState createState() {
    return ChatsState();
  }
}

class ChatsState extends State<Chats> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: dummyData.length,
      itemBuilder: (context, i) => Column(
        children: <Widget>[
          Divider(
            height: 10.0,
          ),
          ListTile(
            leading: CircleAvatar(
              foregroundColor: Theme.of(context).primaryColor,
              backgroundColor: Colors.grey,
              backgroundImage: NetworkImage(dummyData[i].avatarUrl ?? ''),
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  dummyData[i].name ?? '',
                  style: TextStyle(
                      color: const Color.fromARGB(255, 36, 35, 35),
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0),
                ),
                Text(
                  dummyData[i].time ?? '',
                  style: TextStyle(
                      color: const Color.fromARGB(255, 23, 22, 22),
                      fontSize: 15.0),
                ),
              ],
            ),
            subtitle: Container(
              padding: const EdgeInsets.only(top: 5.0),
              child: new Text(
                dummyData[i].message ?? '',
                style: new TextStyle(
                    color: const Color.fromARGB(255, 61, 60, 60),
                    fontSize: 15.0),
              ),
            ),
          )
        ],
      ),
    );
  }
}
