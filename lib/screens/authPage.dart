import 'package:flutter/material.dart';
import 'package:untitled/constants/controllers.dart';

class AuthPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: authController.checkRoleOfUser(),
    );
  }
}
