import "package:quizzizersy/about/about.dart";
import "package:quizzizersy/profile/profile.dart";
import "package:quizzizersy/login/login.dart";
import "package:quizzizersy/topics/topics.dart";
import "package:quizzizersy/home/home.dart";

var appRoutes = {
  "/": (context) => const HomeScreen(),
  "/topics": (context) => const TopicsScreen(),
  "/about": (context) => const AboutScreen(),
  "/profile": (context) => const ProfileScreen(),
  "/login": (context) => const LoginScreen(),
};
