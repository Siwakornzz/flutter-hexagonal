import 'package:flutter/material.dart';
import 'package:hexagonal_research_develop/presentation/pages/profile_screen.dart';

class MenuScreen extends StatefulWidget {
  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // ชิดซ้าย
          children: [
            Theme(
              data: Theme.of(context).copyWith(
                splashColor: Colors.transparent, // ปิดสีตอนกด
                highlightColor: Colors.transparent, // ปิดเอฟเฟกต์ไฮไลต์
              ),
              child: ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ProfileScreen()),
                  );
                },
                leading: Image.asset(
                  "assets/logo/maxim.png",
                  height: 40,
                  width: 50,
                  fit: BoxFit.contain,
                ),
                title: Text("+66 99 999 9999",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
                subtitle: Text("กรอกโปรไฟล์", style: TextStyle(fontSize: 11)),
                trailing: Icon(Icons.arrow_forward_ios, color: Colors.black54),
                tileColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                elevation: 5, // เพิ่มเงาให้ Card ดูโดดเด่นขึ้น
                child: ClipRRect(
                  // ตัดรูปให้ตรงกับขอบ Card
                  borderRadius: BorderRadius.circular(20.0),
                  child: Image.asset(
                    "assets/banner/banner.png",
                    height: 200,
                    width: double.infinity, // ให้รูปขยายเต็ม Card
                    fit: BoxFit.cover, // ปรับให้รูปเต็ม Card โดยไม่เสียสัดส่วน
                  ),
                ),
              ),
            ),
            SizedBox(
              width: double.infinity, // ปุ่มกว้างเต็มจอ
              child: TextButton(
                onPressed: () {
                  print("กดปุ่ม!");
                },
                style: TextButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  alignment:
                      Alignment.centerLeft, // จัดให้ข้อความ + ไอคอนชิดซ้าย
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min, // ให้ Row ไม่ขยายเต็มจอ
                  children: [
                    SizedBox(width: 18), // ระยะห่างระหว่างไอคอนกับข้อความ
                    Icon(
                      Icons.settings,
                      size: 22,
                      color: Colors.grey,
                    ), // ไอคอนอยู่ซ้าย
                    SizedBox(width: 20), // ระยะห่างระหว่างไอคอนกับข้อความ
                    Text("ตั้งค่าพื้นฐาน",
                        style: TextStyle(fontSize: 12, color: Colors.black)),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: double.infinity, // ปุ่มกว้างเต็มจอ
              child: TextButton(
                onPressed: () {
                  print("กดปุ่ม!");
                },
                style: TextButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  alignment:
                      Alignment.centerLeft, // จัดให้ข้อความ + ไอคอนชิดซ้าย
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min, // ให้ Row ไม่ขยายเต็มจอ
                  children: [
                    SizedBox(width: 18), // ระยะห่างระหว่างไอคอนกับข้อความ
                    Icon(
                      Icons.support_agent_sharp,
                      size: 22,
                      color: Colors.grey,
                    ), // ไอคอนอยู่ซ้าย
                    SizedBox(width: 20), // ระยะห่างระหว่างไอคอนกับข้อความ
                    Text("ฝ่ายสนับสนุน",
                        style: TextStyle(fontSize: 12, color: Colors.black)),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: double.infinity, // ปุ่มกว้างเต็มจอ
              child: TextButton(
                onPressed: () {
                  print("กดปุ่ม!");
                },
                style: TextButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  alignment:
                      Alignment.centerLeft, // จัดให้ข้อความ + ไอคอนชิดซ้าย
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min, // ให้ Row ไม่ขยายเต็มจอ
                  children: [
                    SizedBox(width: 18), // ระยะห่างระหว่างไอคอนกับข้อความ
                    Icon(
                      Icons.notifications,
                      size: 22,
                      color: Colors.grey,
                    ), // ไอคอนอยู่ซ้าย
                    SizedBox(width: 20), // ระยะห่างระหว่างไอคอนกับข้อความ
                    Text("การแจ้งเตือน",
                        style: TextStyle(fontSize: 12, color: Colors.black)),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: double.infinity, // ปุ่มกว้างเต็มจอ
              child: TextButton(
                onPressed: () {
                  print("กดปุ่ม!");
                },
                style: TextButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  alignment:
                      Alignment.centerLeft, // จัดให้ข้อความ + ไอคอนชิดซ้าย
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min, // ให้ Row ไม่ขยายเต็มจอ
                  children: [
                    SizedBox(width: 18), // ระยะห่างระหว่างไอคอนกับข้อความ
                    Icon(
                      Icons.payment,
                      size: 22,
                      color: Colors.grey,
                    ), // ไอคอนอยู่ซ้าย
                    SizedBox(width: 20), // ระยะห่างระหว่างไอคอนกับข้อความ
                    Text("รูปแบบการชำระเงิน",
                        style: TextStyle(fontSize: 12, color: Colors.black)),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: double.infinity, // ปุ่มกว้างเต็มจอ
              child: TextButton(
                onPressed: () {
                  print("กดปุ่ม!");
                },
                style: TextButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  alignment:
                      Alignment.centerLeft, // จัดให้ข้อความ + ไอคอนชิดซ้าย
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min, // ให้ Row ไม่ขยายเต็มจอ
                  children: [
                    SizedBox(width: 18), // ระยะห่างระหว่างไอคอนกับข้อความ
                    Icon(
                      Icons.card_giftcard,
                      size: 22,
                      color: Colors.grey,
                    ), // ไอคอนอยู่ซ้าย
                    SizedBox(width: 20), // ระยะห่างระหว่างไอคอนกับข้อความ
                    Text("โค๊ดโปรโมชั่น",
                        style: TextStyle(fontSize: 12, color: Colors.black)),
                  ],
                ),
              ),
            ),
            Divider(),
            SizedBox(
              width: double.infinity, // ปุ่มกว้างเต็มจอ
              child: TextButton(
                onPressed: () {
                  print("กดปุ่ม!");
                },
                style: TextButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  alignment:
                      Alignment.centerLeft, // จัดให้ข้อความ + ไอคอนชิดซ้าย
                ),
                child: Row(
                  children: [
                    SizedBox(width: 18), // ระยะห่างซ้าย

                    Text(
                      "สนใจสมัครเป็นคนขับ",
                      style: TextStyle(fontSize: 12, color: Colors.black),
                    ),

                    Expanded(child: SizedBox()), // ดันให้ไอคอนไปชิดขวา

                    Icon(
                      Icons.open_in_new,
                      size: 22,
                      color: Colors.grey,
                    ), // ไอคอนอยู่ขวาสุด

                    SizedBox(width: 18), // ระยะห่างขวา
                  ],
                ),
              ),
            ),
            SizedBox(
              width: double.infinity, // ปุ่มกว้างเต็มจอ
              child: TextButton(
                onPressed: () {
                  print("กดปุ่ม!");
                },
                style: TextButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  alignment:
                      Alignment.centerLeft, // จัดให้ข้อความ + ไอคอนชิดซ้าย
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min, // ให้ Row ไม่ขยายเต็มจอ
                  children: [
                    SizedBox(width: 18), // ระยะห่างระหว่างไอคอนกับข้อความ

                    Text("แชร์ลิงค์สำหรับโหลดแอพฯ",
                        style: TextStyle(fontSize: 12, color: Colors.black)),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: double.infinity, // ปุ่มกว้างเต็มจอ
              child: TextButton(
                onPressed: () {
                  print("กดปุ่ม!");
                },
                style: TextButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  alignment:
                      Alignment.centerLeft, // จัดให้ข้อความ + ไอคอนชิดซ้าย
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min, // ให้ Row ไม่ขยายเต็มจอ
                  children: [
                    SizedBox(width: 18), // ระยะห่างระหว่างไอคอนกับข้อความ
                    Text("ข้อมูลแอพ",
                        style: TextStyle(fontSize: 12, color: Colors.black)),
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
