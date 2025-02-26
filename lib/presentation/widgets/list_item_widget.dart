import 'package:flutter/material.dart';

// Model class สำหรับรายการ
class ListItem {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onPressed;

  ListItem(
      {required this.icon,
      required this.title,
      required this.subtitle,
      required this.onPressed});
}

// Widget สำหรับแต่ละรายการ
class ListItemWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onPressed;

  ListItemWidget({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4),
      child: Material(
        color:
            Colors.transparent, // ให้สีโปร่งใสเพื่อให้ InkWell สามารถแสดงผลได้
        child: InkWell(
          // onTap: onPressed,
          onTap: () {
            _showBottomSheet(context);
          },
          splashColor: Colors.blue.withOpacity(0.3), // สีของเอฟเฟคตอนกด
          highlightColor: Colors.blue.withOpacity(0.1), // สีของเอฟเฟคตอนลาก
          borderRadius: BorderRadius.circular(8), // มุมโค้งของเอฟเฟค
          child: Container(
            // ใช้ Container เพื่อให้ InkWell ครอบทั้งแถว
            padding: EdgeInsets.symmetric(
                vertical: 10, horizontal: 10), // เพิ่ม padding ในแต่ละด้าน
            child: Row(
              children: [
                Icon(icon, size: 22, color: Colors.grey),
                SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title,
                          style: TextStyle(fontSize: 12, color: Colors.grey)),
                      Text(subtitle, style: TextStyle(fontSize: 14)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void _showBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true, // เพื่อให้ BottomSheet รองรับการขยายได้
    backgroundColor: Colors.white, // ตั้งค่าพื้นหลังให้เป็นสีขาว
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(16), // มุมบนซ้ายมน
        topRight: Radius.circular(16), // มุมบนขวมน
      ),
    ), // กำหนดมุมมนที่ด้านบน
    builder: (BuildContext context) {
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min, // ทำให้ Column ย่อขนาดตามเนื้อหาภายใน
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // เพิ่มติ่งกลางด้วย Container
            Center(
              child: Container(
                width: 40,
                height: 5,
                decoration: BoxDecoration(
                  color: Colors.grey[300], // สีของติ่ง
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),

            SizedBox(height: 16),
            // Title ของ BottomSheet
            Text(
              "แก้ไขข้อมูล",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),

            // First TextField
            TextField(
              decoration: InputDecoration(
                labelText: "ชื่อ",
                
                labelStyle:
                    TextStyle(color: Colors.black, fontSize: 12), // สีของ label
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10), // มุมมน
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10), // มุมมนเมื่อ Focus
                  borderSide:
                      BorderSide(color: Colors.orange), // สีขอบเมื่อ Focus
                ),
                contentPadding: EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 10.0), // ปรับความสูงที่ต้องการ
              ),
            ),
            SizedBox(height: 16),

            // Second TextField
            TextField(
              decoration: InputDecoration(
                labelText: "นามสกุล",
                labelStyle:
                    TextStyle(color: Colors.black, fontSize: 12), // สีของ label
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10), // มุมมน
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10), // มุมมนเมื่อ Focus
                  borderSide:
                      BorderSide(color: Colors.orange), // สีขอบเมื่อ Focus
                ),
                contentPadding: EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 10.0), // ปรับความสูงที่ต้องการ
              ),
            ),
            SizedBox(height: 16),

            // ElevatedButton
            SizedBox(
              width: double.infinity, // ให้ปุ่มเต็มความกว้าง
              child: ElevatedButton(
                onPressed: () {
                  // ปิด BottomSheet และดำเนินการตามฟังก์ชัน
                  Navigator.pop(context); // ปิด BottomSheet
                  // ทำสิ่งที่ต้องการเมื่อกดปุ่มนี้ เช่น ส่งข้อมูลหรืออะไรต่างๆ
                  print("Button Pressed");
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange, // พื้นหลังสีส้ม
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10), // มุมมน
                  ),
                ),
                child: Text(
                  "ตกลง",
                  style: TextStyle(
                    color: Colors.white, // สีของข้อความในปุ่ม
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}
