import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:testing_flutter_uts/auth_services.dart';
import 'package:testing_flutter_uts/home.dart';
import 'package:testing_flutter_uts/salary.dart';

class Gateway extends StatelessWidget {
  final User user;

  const Gateway({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    User? firebaseUser = FirebaseAuth.instance.currentUser;

    return (firebaseUser == null) ? SalaryPage(user: true) : Home();
  }
}
