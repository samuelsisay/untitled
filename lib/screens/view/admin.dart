import 'package:flutter/material.dart';
import 'package:untitled/constants/controllers.dart';

class AdminPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(authController.userModel.value.name),
        ),
        body: Stack(
          children: <Widget>[
            Column(
              children: [
                Expanded(
                  flex: 4,
                  child: Stack(
                    children: [],
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: Container(
                    color: Colors.green,
                  ),
                )
              ],
            )
          ],
        ));
  }
}
