import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sms_autofill/sms_autofill.dart';

class RegisterVerifyOTPScreen extends StatefulWidget {
  const RegisterVerifyOTPScreen({Key? key}) : super(key: key);

  @override
  State<RegisterVerifyOTPScreen> createState() =>
      _RegisterVerifyOTPScreenState();
}

class _RegisterVerifyOTPScreenState extends State<RegisterVerifyOTPScreen> {
  final TextEditingController pinController = TextEditingController();
  // final TextEditingController _otpController1 = TextEditingController();
  // final TextEditingController _otpController2 = TextEditingController();
  // final TextEditingController _otpController3 = TextEditingController();
  // final TextEditingController _otpController4 = TextEditingController();

  bool isButtonVisible = true; // กำหนดตัวแปรเงื่อนไข
  int remainingTime = 90; // ตัวแปรเก็บเวลาที่เหลือ (เวลาเริ่มต้น 90 วินาที)
  late Timer _timer; // Timer สำหรับลดเวลา

  @override
  void initState() {
    super.initState();
    // เริ่มจับเวลาเมื่อเริ่มต้นหน้าจอ
    _listenSmsCode();
    _startTimer();
  }

  @override
  void dispose() {
    // อย่าลืมยกเลิก Timer เมื่อหน้าจอนี้ถูกทิ้ง
    SmsAutoFill().unregisterListener();
    _timer.cancel();
    super.dispose();
  }

  _listenSmsCode() async {
    await SmsAutoFill().listenForCode();
  }

  void _startTimer() {
    // ใช้ Timer เพื่อลดเวลา
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (remainingTime > 0) {
        setState(() {
          remainingTime--;
        });
      } else {
        // เมื่อเวลาหมด เปลี่ยนปุ่มกลับมา
        setState(() {
          isButtonVisible = true;
        });
        _timer.cancel(); // ยกเลิก Timer เมื่อเวลาหมด
      }
    });
  }

  String _formatTime(int seconds) {
    int minutes = seconds ~/ 60; // หามินาที
    int secs = seconds % 60; // หาวินาที
    return "$minutes:${secs.toString().padLeft(2, '0')}"; // รูปแบบ mm:ss
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
                child: Image(
                    image: AssetImage("assets/logo/maxim.png"), width: 100)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center, // จัดให้อยู่กลาง
              children: [
                Text(
                  "ส่งข้อความพร้อมรหัสไปที่ ",
                  textAlign: TextAlign.center,
                ),
                Text(
                  " 0999999999 ",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  "แล้ว",
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            SizedBox(height: 20), // เพิ่มระยะห่างจากบรรทัดบน

            Center(
              child: Text(
                "ตรวจสอบเบอร์โทรศัพท์",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 12),
              ),
            ),
            SizedBox(height: 20), // ระยะห่างจากข้อความ

            // ช่องกรอก OTP
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center, // จัดให้อยู่กลาง
            //   children: [
            //     _buildOTPField(_otpController1),
            //     SizedBox(width: 8), // ระยะห่างระหว่างช่อง
            //     _buildOTPField(_otpController2),
            //     SizedBox(width: 8), // ระยะห่างระหว่างช่อง
            //     _buildOTPField(_otpController3),
            //     SizedBox(width: 8), // ระยะห่างระหว่างช่อง
            //     _buildOTPField(_otpController4),
            //   ],
            // ),
            Center(
              child: SizedBox(
                width: 200,
                child: PinFieldAutoFill(
                  controller: pinController,
                  codeLength: 4,
                  keyboardType: TextInputType.number,
                  // currentCode: "0000", // ตั้งค่าเริ่มต้นเป็น "0000"
                  autoFocus: true,
                  decoration: UnderlineDecoration(
                    textStyle: TextStyle(fontSize: 20, color: Colors.black),
                    colorBuilder: PinListenColorBuilder(
                        Colors.orange, Colors.black), // ปรับสีของเส้นใต้
                    lineHeight: 1.5, // ลดความสูงของเส้นใต้
                    lineStrokeCap: StrokeCap.round, // ทำให้เส้นมนขึ้น
                    gapSpace: 10, // ปรับระยะห่างระหว่างช่อง
                    // เพิ่มการปรับความหนาของเส้นใต้
                  ),
                ),
              ),
            ),

            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: isButtonVisible
                      ? ElevatedButton(
                          onPressed: () {
                            // กดปุ่มแล้วทำการดำเนินการต่อ
                            print("ดำเนินการต่อ");
                            // setState(() {
                            //   // เมื่อกดแล้วเปลี่ยนสถานะให้เป็น false
                            //   isButtonVisible = false;
                            // });
                            Navigator.pushReplacementNamed(context, "/home");
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(255, 255, 206, 59),
                            minimumSize: Size(double.infinity, 50),
                          ),
                          child: Text(
                            "ขอรหัสอีกครั้ง",
                            style: TextStyle(color: Colors.black),
                          ),
                        )
                      : Text(
                          "ขอรหัสอีกครั้ง : ${_formatTime(remainingTime)}", // แสดงเวลา
                          style: TextStyle(fontSize: 14),
                          textAlign: TextAlign.center,
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

//   // สร้างฟังก์ชันเพื่อสร้างช่องกรอก OTP
//   Widget _buildOTPField(TextEditingController controller) {
//     return SizedBox(
//       width: 50, // กำหนดความกว้างของช่องกรอก
//       child: TextField(
//         controller: controller,
//         obscureText: true, // เพื่อไม่ให้เห็นตัวอักษร
//         keyboardType: TextInputType.number, // ให้เป็นช่องกรอกตัวเลข
//         maxLength: 1, // จำกัดการกรอก 1 ตัว
//         textAlign: TextAlign.center,
//         decoration: InputDecoration(
//           counterText: "", // ซ่อนจำนวนตัวอักษรที่กรอก
//           border: InputBorder.none, // ไม่มีกรอบ
//           focusedBorder: UnderlineInputBorder(
//             // เพิ่มเส้นใต้เมื่อฟอร์กัส
//             borderSide: BorderSide(color: Colors.black), // สีของเส้นใต้
//           ),
//           enabledBorder: UnderlineInputBorder(
//             // เพิ่มเส้นใต้เมื่อไม่ได้ฟอร์กัส
//             borderSide: BorderSide(color: Colors.black), // สีของเส้นใต้
//           ),
//           hintText: "0", // ค่า default เป็น "0"
//         ),
//       ),
//     );
//   }
// }
