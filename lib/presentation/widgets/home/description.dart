import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeDescriptionScreen extends StatefulWidget {
  @override
  _HomeDescriptionScreenState createState() => _HomeDescriptionScreenState();
}

class _HomeDescriptionScreenState extends State<HomeDescriptionScreen> {
  bool isSwitched = false; // ตัวแปรสำหรับ switch
  String selectedOption = '฿50';
  TextEditingController textController =
      TextEditingController(); // สำหรับ TextField

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'รายละเอียดออเดอร์',
          style: TextStyle(color: Colors.black, fontSize: 12),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        toolbarHeight: 56,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Divider ระหว่าง AppBar และ Body
            Divider(),

            // Row สำหรับ Switch
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("เงินทอนตั้งแต่", style: TextStyle(fontSize: 14)),
                Transform.scale(
                  scale: 0.7, // เปลี่ยนขนาดเป็น 1.5 เท่าของขนาดปกติ
                  child: CupertinoSwitch(
                    value: isSwitched,
                    onChanged: (value) {
                      setState(() {
                        isSwitched = value;
                        selectedOption =
                            '฿50'; // Clear selected option when switched
                      });
                    },
                    activeColor: Colors.orange, // สีแถบเมื่อเปิด
                    trackColor: Colors.grey, // สีแถบเมื่อปิด
                  ),
                ),
              ],
            ),

            // ถ้ามีการสวิตช์เป็นจริง, จะแสดงตัวเลือก
            if (isSwitched)
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // ฿50
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedOption = '฿50';
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.all(8.0), // ปรับขนาดให้เล็กลง
                      margin: EdgeInsets.only(right: 8.0), // เพิ่มระยะห่างขวา
                      decoration: BoxDecoration(
                        color: selectedOption == '฿50'
                            ? Colors.orange
                            : Colors.white,
                        border: Border.all(
                          color: Colors.black.withOpacity(0.2), // กรอบจางๆ
                        ),
                        borderRadius: BorderRadius.circular(12.0), // มุมมนๆ
                      ),
                      child: Text('฿50',
                          style: TextStyle(fontSize: 14)), // ขนาดฟอนต์
                    ),
                  ),
                  // ฿100
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedOption = '฿100';
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.all(8.0), // ปรับขนาดให้เล็กลง
                      margin: EdgeInsets.only(right: 8.0), // เพิ่มระยะห่างขวา
                      decoration: BoxDecoration(
                        color: selectedOption == '฿100'
                            ? Colors.orange
                            : Colors.white,
                        border: Border.all(
                          color: Colors.black.withOpacity(0.2), // กรอบจางๆ
                        ),
                        borderRadius: BorderRadius.circular(12.0), // มุมมนๆ
                      ),
                      child: Text('฿100',
                          style: TextStyle(fontSize: 14)), // ขนาดฟอนต์
                    ),
                  ),
                  // ฿500
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedOption = '฿500';
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.all(8.0), // ปรับขนาดให้เล็กลง
                      margin: EdgeInsets.only(right: 8.0), // เพิ่มระยะห่างขวา
                      decoration: BoxDecoration(
                        color: selectedOption == '฿500'
                            ? Colors.orange
                            : Colors.white,
                        border: Border.all(
                          color: Colors.black.withOpacity(0.2), // กรอบจางๆ
                        ),
                        borderRadius: BorderRadius.circular(12.0), // มุมมนๆ
                      ),
                      child: Text('฿500',
                          style: TextStyle(fontSize: 14)), // ขนาดฟอนต์
                    ),
                  ),
                  // ฿1000
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedOption = '฿1000';
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.all(8.0), // ปรับขนาดให้เล็กลง
                      decoration: BoxDecoration(
                        color: selectedOption == '฿1000'
                            ? Colors.orange
                            : Colors.white,
                        border: Border.all(
                          color: Colors.black.withOpacity(0.2), // กรอบจางๆ
                        ),
                        borderRadius: BorderRadius.circular(12.0), // มุมมนๆ
                      ),
                      child: Text('฿1000',
                          style: TextStyle(fontSize: 14)), // ขนาดฟอนต์
                    ),
                  ),
                ],
              ),

            SizedBox(height: 20),

            TextField(
              controller: textController,
              decoration: InputDecoration(
                labelText: 'เบอร์ติดต่อสำรอง',
                labelStyle: TextStyle(color: Colors.black),
                prefixIcon: Icon(Icons.phone, size: 18), // ขนาดของไอคอน
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18.0), // ลดขนาด radius
                  borderSide: BorderSide(
                      color: Colors.yellow, width: 1.5), // เปลี่ยนสีและขนาดกรอบ
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  borderSide: BorderSide(color: Colors.orange, width: 1.5),
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                    Icons.contacts,
                    size: 18,
                    color: const Color.fromARGB(255, 24, 94, 26),
                  ), // ขนาดของไอคอน
                  onPressed: () {
                    // ใส่ฟังก์ชันที่ต้องการเมื่อกดปุ่ม
                  },
                ),
              ),
              style: TextStyle(fontSize: 10), // ปรับขนาดตัวอักษร
              textAlignVertical:
                  TextAlignVertical.center, // ทำให้ข้อความตรงกลาง
            ),

            SizedBox(height: 10),

// Subtitle ข้างใต้ TextField
            Text(
              'หากสั่งออเดอร์ให้แก่บุคคลที่ใช้เบอร์โทรอื่น',
              style: TextStyle(color: Colors.grey, fontSize: 12),
            ),

            SizedBox(height: 14),

// TextField ที่มี icon ซ้าย
            TextField(
              decoration: InputDecoration(
                labelText: 'ข้อมูลเพิ่มเติม',
                labelStyle: TextStyle(color: Colors.black),
                prefixIcon: Icon(Icons.message, size: 18), // ขนาดของไอคอน
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18.0), // ลดขนาด radius
                  borderSide: BorderSide(
                      color: Colors.grey, width: 1.5), // เปลี่ยนสีและขนาดกรอบ
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  borderSide: BorderSide(color: Colors.orange, width: 1.5),
                ),
              ),
              style: TextStyle(fontSize: 10), // ปรับขนาดตัวอักษร
              textAlignVertical:
                  TextAlignVertical.center, // ทำให้ข้อความตรงกลาง
            ),

            Spacer(),
            // Button ที่อยู่ชิดขอบล่างสุด
            Padding(
              padding: EdgeInsets.only(bottom: 16.0), // ปรับระยะห่างจากขอบล่าง
              child: SizedBox(
                width: double.infinity, // ให้ปุ่มกว้างเต็ม
                child: ElevatedButton(
                  onPressed: () {
                    // Action เมื่อกดปุ่ม
                    Navigator.pop(context);
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        Colors.orangeAccent), // เปลี่ยนสีปุ่มเป็นสีเหลือง
                  ),
                  child: Text(
                    "เสร็จสิ้น",
                    style: TextStyle(
                        color: Colors.black), // เปลี่ยนสีของข้อความภายในปุ่ม
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
