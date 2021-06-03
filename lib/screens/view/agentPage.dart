import 'package:flutter/material.dart';
import 'package:untitled/constants/controllers.dart';

class AgentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        centerTitle: true,
        brightness: Brightness.dark,
        title: Text(
          authController.userModel.value.name,
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: ElevatedButton(
                onPressed: () {
                  authController.signOut();
                },
                child: Text('agent Log Out'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
