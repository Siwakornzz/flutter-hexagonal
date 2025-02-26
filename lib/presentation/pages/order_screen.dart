import 'package:flutter/material.dart';
import 'package:hexagonal_research_develop/presentation/widgets/logo_button_widget.dart';

class OrderScreen extends StatefulWidget {
  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 14),
        child: Column(
          children: [
            LogoButtonWidget(
              buttonText: "สุราษฎร์ธานี",
              onPressed: () {
                // กดแล้วทำอะไร
              },
            ),
            Expanded(
              // ทำให้ส่วนนี้เต็มจอแนวตั้ง
              child: Center(
                // จัดตรงกลาง
                child: Column(
                  mainAxisSize:
                      MainAxisSize.min, // ให้คอลัมน์ใช้พื้นที่ตามขนาดลูก
                  children: [
                    Image.asset(
                      "assets/logo/maxim.png",
                      height: 120,
                    ),
                    SizedBox(height: 8), // ลดระยะห่างให้พอดี
                    Text('ออเดอร์ของคุณอยู่ที่นี่'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
