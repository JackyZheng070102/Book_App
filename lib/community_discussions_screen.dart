import 'package:flutter/material.dart';

class CommunityDiscussionsScreen extends StatelessWidget {
  const CommunityDiscussionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Community Discussions"),
      ),
      body: Center(
        child: Text("Discussions will appear here."),
      ),
    );
  }
}
