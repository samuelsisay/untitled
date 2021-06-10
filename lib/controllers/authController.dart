import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/constants/firebase.dart';
import 'package:untitled/models/user.dart';
import 'package:untitled/screens/view/admin.dart';
import 'package:untitled/screens/view/agentPage.dart';
import 'package:untitled/screens/authentication/auth.dart';
import 'package:untitled/screens/home/home.dart';
import 'package:untitled/screens/view/authPage.dart';
import 'package:untitled/utils/helpers/showLoading.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();
  Rx<User> firebaseUser;
  RxBool isLoggedIn = false.obs;
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController role = TextEditingController();
  String usersCollection = "users";
  Rx<UserModel> userModel = UserModel().obs;

  @override
  void onReady() {
    super.onReady();

    firebaseUser = Rx<User>(auth.currentUser);
    firebaseUser.bindStream(auth.userChanges());
    ever(firebaseUser, _setInitialScreen);
  }

  _setInitialScreen(User user) {
    if (user == null) {
      Get.offAll(() => AuthenticationScreen());
    } else {
      _initializeUserModel(user.uid);

      Get.offAll(AuthPage());
    }
  }

  void signIn() async {
    try {
      showLoading();
      await auth
          .signInWithEmailAndPassword(
              email: email.text.trim(), password: password.text.trim())
          .then((result) {
        String _userId = result.user.uid;
        _initializeUserModel(_userId);
        _clearControllers();
      });
    } catch (e) {
      Get.snackbar(
        "Sign In Failed",
        e.message,
        backgroundColor: Colors.red,
        duration: Duration(seconds: 05),
        colorText: Colors.white,
      );
    }
  }

  void signUp() async {
    try {
      showLoading();
      await auth
          .createUserWithEmailAndPassword(
              email: email.text.trim(), password: password.text.trim())
          .then((result) {
        String _userId = result.user.uid;
        _addUserToFirestore(_userId);
        _initializeUserModel(_userId);
        _clearControllers();
      });
    } catch (e) {
      Get.snackbar("Sign In Failed", e.message,
          backgroundColor: Colors.red[700],
          colorText: Colors.white,
          duration: Duration(seconds: 05));
    }
  }

  void signOut() async {
    auth.signOut();
  }

  _addUserToFirestore(String userId) {
    firebaseFirestore.collection(usersCollection).doc(userId).set({
      "name": name.text.trim(),
      "id": userId,
      "email": email.text.trim(),
      'role': role.text.trim(),
    });
  }

  _initializeUserModel(String userId) async {
    userModel.value = await firebaseFirestore
        .collection(usersCollection)
        .doc(userId)
        .get()
        .then((doc) => UserModel.fromSnapshot(doc));
  }

  _clearControllers() {
    role.clear();
    name.clear();
    email.clear();
    password.clear();
  }

  checkRoleOfUser() {
    return StreamBuilder<DocumentSnapshot>(
      stream: firebaseFirestore
          .collection('users')
          .doc(firebaseUser.value.uid)
          .snapshots(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Error ${snapshot.error}');
        }
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return Text('Loading...');
          default:
            return checkRoleOfAdmin(snapshot.data);
        }
      },
    );
  }

  checkRoleOfAdmin(DocumentSnapshot snapshots) {
    final user = snapshots.data();

    if (user['role'] == 'admin') {
      return AdminPage();
    } else if (user['role'] == 'agent') {
      return AgentPage();
    } else {
      return HomeScreen();
    }
  }
}
