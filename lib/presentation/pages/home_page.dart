import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("🏡 Home Page")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("🎉 ยินดีต้อนรับ!", style: TextStyle(fontSize: 22)),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // ลบ Token ออกจากระบบ แล้วกลับไปหน้า Login
                Navigator.pushReplacementNamed(context, "/login");
              },
              child: Text("🔴 Logout"),
            ),
          ],
        ),
      ),
    );
  }
}
