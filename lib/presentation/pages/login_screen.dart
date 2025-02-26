import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>(); // ใช้สำหรับ Form Validation
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void _login() {
    if (_formKey.currentState!.validate()) {
      // 🚀 สมมติว่าล็อกอินสำเร็จ (เก็บ Token ไว้)
      Navigator.pushReplacementNamed(context, "/home"); // ไปหน้า Home
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("🔑 Login Page")),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("เข้าสู่ระบบ", style: TextStyle(fontSize: 24)),
              SizedBox(height: 20),
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(labelText: "📧 Email"),
                validator: (value) => value!.isEmpty ? "กรุณากรอกอีเมล" : null,
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: passwordController,
                decoration: InputDecoration(labelText: "🔒 Password"),
                obscureText: true,
                validator: (value) =>
                    value!.isEmpty ? "กรุณากรอกรหัสผ่าน" : null,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _login,
                child: Text("✅ Login"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
