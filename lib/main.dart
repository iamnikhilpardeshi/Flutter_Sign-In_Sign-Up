import 'package:flutter/material.dart';
import 'package:flutter_base_project/SignIn/SignInPageFirst.dart';
import 'package:flutter_base_project/SignIn/SignInPageFourth.dart';
import 'package:flutter_base_project/SignIn/SignInPageSecond.dart';
import 'package:flutter_base_project/SignIn/SignInPageThird.dart';
import 'package:flutter_base_project/SignUp/SignUpPageFirst.dart';
import 'package:flutter_base_project/SignUp/SignUpPageFourth.dart';
import 'package:flutter_base_project/SignUp/SignUpPageSecond.dart';
import 'package:flutter_base_project/SignUp/SignUpPageThird.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sign-In Sign-Up',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const LandingScreen(),
    );
  }
}

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  List<String> items = [
    'Sign In 1',
    'Sign Up 1',
    'Sign In 2',
    'Sign Up 2',
    'Sign In 3',
    'Sign Up 3',
    'Sign In 4',
    'Sign Up 4',
  ];

  Map<String, Widget Function()> routes = {
    'Sign In 1': () => const SignInPageFirst(),
    'Sign Up 1': () => const SignUpPageFirst(),
    'Sign In 2': () => const SignInPageSecond(),
    'Sign Up 2': () => const SignUpPageSecond(),
    'Sign In 3': () => const SignInPageThird(),
    'Sign Up 3': () => const SignUpPageThird(),
    'Sign In 4': () => const SignInPageFourth(),
    'Sign Up 4': () => const SignUpPageFourth(),
  };

  List<Color> colors = [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.yellow,
    Colors.purple,
    Colors.orange,
    Colors.pink,
    Colors.brown
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Sign-In Sign-Up Ui Designs',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
          ),
        ),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.red,
                Colors.green,
                Colors.blue,
                Colors.yellow,
                Colors.purple,
                Colors.orange,
                Colors.pink,
                Colors.brown
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(color: Colors.white),
        child: GridView.count(
          crossAxisCount: 2,
          children: List.generate(items.length, (index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => routes[items[index]]!()),
                  );
                },
                child: Card(
                  color: colors[index % colors.length],
                  child: Center(
                    child: Text(
                      items[index],
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.white,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
