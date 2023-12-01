import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:testing_flutter_uts/auth_services.dart';
import 'package:testing_flutter_uts/gateway.dart';
import 'package:testing_flutter_uts/home.dart';
import 'user.dart'; // Import the User class
import 'db_helper.dart'; // Import your DbHelper class
import 'login.dart'; // Import the LoginPage class

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController fullNameController =
      TextEditingController(); // Added controller for full name

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller:
                  fullNameController, // Updated controller for full name
              decoration: InputDecoration(labelText: 'Full Name'),
            ),
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                String fullName = fullNameController.text;
                String email = emailController.text;
                String password = passwordController.text;

                // // Sign up user
                // User newUser = User(
                //   fullName: fullName,
                //   email: email,
                //   password: password,
                //   role: 'user',
                // );
                // await DbHelper().saveUser(newUser);

                AuthServices.signUpFirebase(email, password, context);

                // Navigate to the login page
                await Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (context) => Home()));
              },
              child: Text('Sign Up'),
            ),
          ],
        ),
      ),
    );
  }
}
