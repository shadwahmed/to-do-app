import 'package:flutter/material.dart';
import 'package:to_do_app/auth/login.dart';
import 'package:to_do_app/auth/register.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});
  static const String routeName = 'Auth';
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text("Login"),
          bottom: TabBar(
            tabs: [
              Tab(
                child: Text("Login"),
              ),
              Tab(
                child: Text("Register"),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            LoginTab(),
            RegisterTab(),
          ],
        ),
      ),
    );
  }
}
