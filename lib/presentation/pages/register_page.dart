import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  void _register() {
    if (_formKey.currentState!.validate()) {
      // 🚀 สมมติว่าสมัครสมาชิกสำเร็จ แล้วกลับไปหน้า Login
      Navigator.pushReplacementNamed(context, "/login");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("📝 Register Page")),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("สมัครสมาชิก", style: TextStyle(fontSize: 24)),
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
              SizedBox(height: 10),
              TextFormField(
                controller: confirmPasswordController,
                decoration: InputDecoration(labelText: "🔑 Confirm Password"),
                obscureText: true,
                validator: (value) {
                  if (value!.isEmpty) return "กรุณายืนยันรหัสผ่าน";
                  if (value != passwordController.text)
                    return "รหัสผ่านไม่ตรงกัน";
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _register,
                child: Text("✅ Register"),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, "/login");
                },
                child: Text("🔙 มีบัญชีอยู่แล้ว? Login"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
