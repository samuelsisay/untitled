import 'package:flutter/material.dart';
import 'package:untitled/constants/controllers.dart';

class AdminPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(authController.userModel.value.name),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                authController.signOut();
              },
              child: Text('admin Log Out'),
            )
          ],
        ),
      ),
    );
  }
}
