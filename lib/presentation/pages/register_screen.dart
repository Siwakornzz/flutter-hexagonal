import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hexagonal_research_develop/core/infrastructure/theme/fonts.dart';
import 'package:hexagonal_research_develop/presentation/widgets/register/register_country.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

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

  final TextEditingController phoneController = TextEditingController();
  final TextEditingController codePromoController = TextEditingController();
  bool isPhoneValid = true; // ตัวแปรตรวจสอบเบอร์โทร

  @override
  void initState() {
    super.initState();
    phoneController.text = "+66";
  }

  // ฟังก์ชันตรวจสอบเบอร์โทร
  void _checkPhoneNumber(String phone) {
    setState(() {
      isPhoneValid = phone.isNotEmpty; // ตรวจสอบว่าเบอร์โทรถูกกรอกหรือไม่
    });
  }

  void _register() {
    if (_formKey.currentState!.validate()) {
      // 🚀 สมมติว่าสมัครสมาชิกสำเร็จ แล้วกลับไปหน้า Login
      Navigator.pushReplacementNamed(context, "/login");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start, // ปรับให้เนื้อหาชิดบน
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child:
                  Image(image: AssetImage("assets/logo/maxim.png"), width: 100),
            ),
            Center(
              child: Text("ลงชื่อเข้าใช้ผ่านเบอร์โทรศัพท์",
                  style: TextStyle(fontSize: 13)),
            ),
            SizedBox(height: 20),

            // country picker
            // IntlPhoneField(
            //   controller: phoneController,
            //   decoration: InputDecoration(
            //     border: OutlineInputBorder(
            //       borderRadius: BorderRadius.circular(15.0),
            //     ),
            //     enabledBorder: OutlineInputBorder(
            //       borderRadius: BorderRadius.circular(15.0),
            //       borderSide: BorderSide(
            //           color: Colors.grey), // สำหรับกรณีที่ไม่ได้ focus
            //     ),
            //     focusedBorder: OutlineInputBorder(
            //       borderRadius: BorderRadius.circular(15.0),
            //       borderSide: BorderSide(
            //           color: Colors.grey), // สำหรับกรณีที่ focus อยู่
            //     ),
            //     contentPadding: EdgeInsets.symmetric(
            //         vertical: 10, horizontal: 10), // ปรับขนาดความสูงภายใน

            //     suffixIcon: Icon(Icons.keyboard_arrow_right),
            //   ),
            //   initialCountryCode: 'TH', // ประเทศเริ่มต้น
            //   onChanged: (phone) {
            //     _checkPhoneNumber(phoneController.text); // ตรวจสอบเบอร์โทร
            //   },
            // ),

            InkWell(
              onTap: () {
                print('กดเลือกประเทศ');
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => RegisterCountryScreen()),
                );
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text("🇹🇭"),
                        SizedBox(width: 10),
                        Text(
                          'ไทย',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
                  ],
                ),
              ),
            ),

            SizedBox(height: 20),
            TextFormField(
              controller: phoneController,
              style: TextStyle(fontSize: 12),
              decoration: InputDecoration(
                labelText: "โทรศัพท์",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                  borderSide: BorderSide(
                      color: Colors.grey), // สำหรับกรณีที่ไม่ได้ focus
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                  borderSide: BorderSide(
                    color: const Color.fromARGB(255, 255, 206, 59),
                  ), // สำหรับกรณีที่ focus อยู่
                ),
                contentPadding: EdgeInsets.symmetric(
                    vertical: 10, horizontal: 10), // ปรับขนาดความสูงภายใน

                suffixIcon: Icon(Icons.close),
              ),
              validator: (value) =>
                  value!.isEmpty ? "ตรวจสอบเบอร์โทรศัพท์" : null,
            ),

            SizedBox(height: 20),
            TextFormField(
              controller: codePromoController,
              decoration: InputDecoration(
                labelText: "โค๊ดโปรโมชั่น (ถ้ามี)",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                  borderSide: BorderSide(
                      color: Colors.grey), // สำหรับกรณีที่ไม่ได้ focus
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                  borderSide: BorderSide(
                    color: const Color.fromARGB(255, 255, 206, 59),
                  ), // สำหรับกรณีที่ focus อยู่
                ),
                contentPadding: EdgeInsets.symmetric(
                    vertical: 10, horizontal: 10), // ปรับขนาดความสูงภายใน
              ),
              validator: (value) =>
                  value!.isEmpty ? "ตรวจสอบเบอร์โทรศัพท์" : null,
            ),

            SizedBox(height: 20),

            // แสดงปุ่ม "ดำเนินการต่อ" เมื่อกรอกเบอร์โทรแล้ว
            Visibility(
                visible: isPhoneValid, // ถ้าเบอร์โทรถูกกรอก จะให้แสดงปุ่ม
                child: Padding(
                  padding: const EdgeInsets.only(top: 22),
                  child: ElevatedButton(
                    onPressed: () {
                      // กดปุ่มแล้วทำการดำเนินการต่อ
                      print("ดำเนินการต่อ");
                      Navigator.pushReplacementNamed(
                          context, "/registerverifyotp"); // ไปหน้า Home
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(
                          255, 255, 206, 59), // เปลี่ยนสีปุ่ม (สีพื้นหลัง)
                      minimumSize: Size(double.infinity,
                          50), // ปรับให้ปุ่มยาวเต็มความกว้างและความสูงเป็น 50
                    ),
                    child: Text(
                      "ดำเนินการต่อ",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                )),

            // The text with two clickable links
            Expanded(
              // ใช้ Expanded เพื่อให้ text อยู่ที่ด้านล่างสุด
              child: Align(
                alignment: Alignment.bottomCenter, // จัดให้ text อยู่ล่างสุด

                child: Padding(
                  padding: const EdgeInsets.only(
                      bottom: 20), // ระยะห่างจากขอบด้านล่าง
                  child: RichText(
                    textAlign: TextAlign.center, // จัดข้อความให้กลางในแนวนอน
                    text: TextSpan(
                      style: TextStyle(
                          fontFamily: AppFonts.prompt,
                          color: Colors.black,
                          fontSize: 10),
                      children: [
                        TextSpan(
                          text: 'ยืนยันหมายเลขโทรศัพท์และยอมรับ ',
                          style: TextStyle(
                              fontFamily: AppFonts.prompt, color: Colors.black),
                        ),
                        TextSpan(
                          text: 'ข้อตกลงการบริการ',
                          style: TextStyle(
                            color: Colors.blue,
                            decoration:
                                TextDecoration.underline, // เพิ่ม underline
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              print("ข้อตกลงการบริการ tapped");
                            },
                        ),
                        TextSpan(
                          text: ' และ ',
                          style: TextStyle(
                              fontFamily: AppFonts.prompt, color: Colors.black),
                        ),
                        TextSpan(
                          text: 'นโยบายการจัดการข้อมูลส่วนบุคคล',
                          style: TextStyle(
                            fontFamily: AppFonts.prompt,
                            color: Colors.blue,
                            decoration:
                                TextDecoration.underline, // เพิ่ม underline
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              print("นโยบายการจัดการข้อมูลส่วนบุคคล tapped");
                            },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
