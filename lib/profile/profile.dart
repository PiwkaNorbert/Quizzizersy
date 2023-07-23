import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quizzizersy/services/auth.dart';
import 'package:quizzizersy/services/firestore.dart';
import 'package:quizzizersy/services/models.dart';
import 'package:quizzizersy/services/services.dart';
import 'package:quizzizersy/shared/loading.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var report = Provider.of<Report>(context);
    var user = AuthService().user;

    if (user != null) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal,
          title: Text(user.displayName ?? "guest"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 100,
                height: 100,
                margin: const EdgeInsets.only(top: 50),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: NetworkImage(user.photoURL ??
                        "https://www.gravatar.com/avatar/placeholder"),
                  ),
                ),
              ),
              Text(
                user.email ?? "",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const Spacer(),
              Text('${report.total}',
                  style: Theme.of(context).textTheme.displayMedium),
              const Spacer(),
              ElevatedButton(
                onPressed: () async {
                  await AuthService().signOut();
                  Navigator.pushNamedAndRemoveUntil(
                      context, '/', (route) => false);
                },
                child: const Text('Logout'),
              ),
              const Spacer(),
            ],
          ),
        ),
      );
    } else {
      return const LoadingScreen();
    }
  }
}
