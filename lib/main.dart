import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool isLoading = false;

  Future<void> signIn() async {
    setState(() {
      isLoading = true;
    });

    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      Fluttertoast.showToast(msg: "Login successful!");
      // Navigate to next screen or home screen after successful login
    } catch (e) {
      Fluttertoast.showToast(msg: "Login failed: $e");
    }

    setState(() {
      isLoading = false;
    });
  }

  Future<void> signUp() async {
    setState(() {
      isLoading = true;
    });

    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      Fluttertoast.showToast(msg: "Signup successful!");
    } catch (e) {
      Fluttertoast.showToast(msg: "Signup failed: $e");
    }

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Firebase Auth Example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            SizedBox(height: 20),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            if (isLoading)
              CircularProgressIndicator()
            else ...[
              ElevatedButton(
                onPressed: signIn,
                child: Text('Login'),
              ),
              ElevatedButton(
                onPressed: signUp,
                child: Text('Sign Up'),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
