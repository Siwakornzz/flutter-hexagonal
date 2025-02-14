import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hexagonal_research_develop/presentation/pages/home_page.dart';
import 'package:hexagonal_research_develop/presentation/pages/login_page.dart';
import 'package:hexagonal_research_develop/presentation/pages/register_page.dart';
import 'presentation/pages/splash_screen.dart';

void main() async {
  await dotenv.load(fileName: ".env"); // โหลด Config

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter App',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: "/", // หน้าแรก
      routes: {
        "/": (context) => SplashScreen(),
        "/login": (context) => LoginPage(),
        "/register": (context) => RegisterPage(),
        "/home": (context) => HomePage(),
      },
    );
  }
}
