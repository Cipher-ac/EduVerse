import 'package:flutter/material.dart';
import 'login_page.dart';
import 'register_page.dart';
import 'forgot_password_page.dart';
import 'create_post_page.dart';

void main() {
  runApp(const MeuApp());
}

class MeuApp extends StatelessWidget {
  const MeuApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EduVerse',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          inputDecorationTheme: InputDecorationTheme(
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(color: Color(0xFF5AC8FA))))),
      initialRoute: '/',
      routes: {
        '/': (_) => const CreatePostPage(),
        '/register': (_) => const RegisterPage(),
        '/forgot': (_) => const ForgotPasswordPage(),
        '/create': (_) => const CreatePostPage(),
      },
    );
  }
}
