import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sharedd/pages/home/home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () async {
              final SharedPreferences preferences =
                  await SharedPreferences.getInstance();
              await preferences.setBool('login', true).then((v) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomeScreen(),
                  ),
                );
              });
              setState(() {
                
              });
            },
            child: const Text("Go to Home"),
          )
        ],
      ),
    );
  }
}
