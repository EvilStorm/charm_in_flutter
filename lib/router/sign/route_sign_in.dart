import 'package:flutter/material.dart';

class SignInRoute extends StatelessWidget {
  const SignInRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: true,
        child: Container(
          child: Text("Sign In!!!"),
        ),
      ),
    );
  }
}
