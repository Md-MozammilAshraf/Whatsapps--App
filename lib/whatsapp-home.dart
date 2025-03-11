import 'package:flutter/material.dart';
import 'package:whatspps/pages/calls.dart';
import 'package:whatspps/pages/camera.dart';
import 'package:whatspps/pages/chats.dart';
import 'package:whatspps/pages/status.dart';
import 'package:camera/camera.dart';

class WhatsAppHome extends StatefulWidget {
  var cameras;
  WhatsAppHome(this.cameras);

  @override
  _WhatsAppHomeState createState() => _WhatsAppHomeState();
}

class _WhatsAppHomeState extends State<WhatsAppHome>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this, initialIndex: 1);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("WhatsApp"),
        elevation: 0.7,
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: const Color.fromARGB(255, 73, 139, 49),
          tabs: <Widget>[
            Tab(icon: Icon(Icons.camera_alt)),
            Tab(text: "CHATS"),
            Tab(text: "STATUS"),
            Tab(text: "CALLS"),
          ],
        ),
        actions: <Widget>[
          Icon(Icons.search),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
          ),
          Icon(Icons.more_vert),
        ],
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          Camera(widget.cameras),
          Chats(),
          Status(),
          Calls(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        child: Icon(Icons.message),
        onPressed: () => print("open chat"),
      ),
    );
  }
}
