import 'package:flutter/material.dart';
import 'package:hexagonal_research_develop/presentation/pages/home_screen.dart';
import 'dart:async';

import 'package:hexagonal_research_develop/presentation/pages/register_screen.dart';
import 'package:hexagonal_research_develop/presentation/widgets/register/register_province.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToNextScreen();
  }

  void _navigateToNextScreen() async {
    await Future.delayed(Duration(seconds: 2)); // แสดง Splash 2 วิ

    // **เช็ค Token ว่ามีไหม**
    bool isLoggedIn = await _checkLoginStatus();

    // ไปหน้า Home หรือ Login
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) =>
            isLoggedIn ? HomePage() : RegisterProvinceScreen(),
      ),
    );
  }

  Future<bool> _checkLoginStatus() async {
    // **สมมติว่าเช็ค Token จาก SharedPreferences (Local Storage)**
    await Future.delayed(Duration(milliseconds: 500)); // Mock delay
    return false; // 🔴 เปลี่ยนเป็น `true` ถ้าล็อกอินอยู่
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Text("Loading...", style: TextStyle(fontSize: 18)),
            Image.asset('assets/logo/maxim.png', width: 200, height: 200),
            SizedBox(height: 10),
            CircularProgressIndicator(), // แสดง Loading
          ],
        ),
      ),
    );
  }
}
