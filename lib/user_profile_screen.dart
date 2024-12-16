import 'package:flutter/material.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User Profile"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("User details will be shown here."),
            ElevatedButton(
              onPressed: () {
                // Implement logout functionality
              },
              child: Text("Logout"),
            )
          ],
        ),
      ),
    );
  }
}
