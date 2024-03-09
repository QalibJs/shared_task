import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sharedd/pages/home/home_screen.dart';
import 'package:sharedd/pages/login/login_screen.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool? isLogin;

  @override
  void initState() {
    getInstance();
    super.initState();
  }

  void getInstance() async {
    final preferences = await SharedPreferences.getInstance();
    isLogin = preferences.getBool("login");
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: isLogin == false ? const HomeScreen() : const LoginScreen(),
    );
  }
}
