import 'package:flutter/material.dart';
import 'package:quizzizersy/login/login.dart';
import 'package:quizzizersy/quiz/quiz.dart';
import 'package:quizzizersy/services/auth.dart';
import 'package:quizzizersy/topics/topics.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: AuthService().userStream,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text('Loading...');
          } else if (snapshot.hasError) {
            return const Center(child: Text('Error'));
          } else if (snapshot.hasData) {
            return const TopicScreen();
          } else {
            return const LoginScreen();
          }
        });
  }
}
