import 'package:flutter/material.dart';
import 'package:hexagonal_research_develop/presentation/widgets/home/carselect.dart';
import 'package:hexagonal_research_develop/presentation/widgets/home/description.dart';
import 'package:hexagonal_research_develop/presentation/widgets/home/map.dart';
import 'package:hexagonal_research_develop/presentation/widgets/home/modalNow.dart';
import 'package:hexagonal_research_develop/presentation/widgets/logo_button_widget.dart';
import 'package:hexagonal_research_develop/presentation/widgets/register/register_country.dart';
import 'package:hexagonal_research_develop/presentation/widgets/register/register_province.dart';

class HomePageWidget extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePageWidget> {
  final TextEditingController controller1 = TextEditingController();
  final TextEditingController controller2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 14),
        child: Column(
          children: [
            // Logo Button
            LogoButtonWidget(
              buttonText: "สุราษฎร์ธานี",
              onPressed: () {
                // กดแล้วทำอะไร
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => RegisterProvinceScreen()),
                );
              },
            ),
            // TextFormField สำหรับ "เดินทางจาก"
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MapWithBottomSheet()),
                );
              },
              child: AbsorbPointer(
                // ป้องกันไม่ให้ TextFormField เปิดคีย์บอร์ด
                child: TextFormField(
                  controller: controller2,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey[200],
                    labelText: 'เดินทางจาก',
                    labelStyle: TextStyle(color: Colors.black, fontSize: 13),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                    suffixIcon: Icon(Icons.keyboard_arrow_right_outlined),
                    prefixIcon: Icon(Icons.circle_outlined, color: Colors.red),
                  ),
                ),
              ),
            ),

            SizedBox(height: 7),
            // TextFormField สำหรับ "ไปที่"
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MapWithBottomSheet()),
                );
              },
              child: AbsorbPointer(
                child: TextFormField(
                  controller: controller2,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey[200],
                    labelText: 'ไปที่',
                    labelStyle: TextStyle(color: Colors.black, fontSize: 13),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                    suffixIcon: Icon(Icons.keyboard_arrow_right_outlined),
                    prefixIcon: Icon(Icons.circle_outlined,
                        color: Color.fromARGB(255, 89, 134, 92)),
                  ),
                ),
              ),
            ),

            // SizedBox(height: 140),
            // Card สำหรับรายละเอียด
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter, // จัดให้ Card อยู่ล่างสุด
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  elevation: 0,
                  color: Colors.white,
                  child: SizedBox(
                    width: 500,
                    height: 266,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        HomeDescriptionScreen()),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  Color.fromARGB(255, 243, 243, 243),
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                            ),
                            child: Row(
                              children: [
                                Icon(Icons.account_tree_outlined,
                                    color: Colors.green),
                                SizedBox(width: 8),
                                Text(
                                  "รายละเอียด",
                                  style: TextStyle(
                                      color: Colors.green, fontSize: 12),
                                ),
                              ],
                            ),
                          ),
                        ),

                        // 2 ปุ่มใน Row
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 2),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // ปุ่มแรก
                              Expanded(
                                child: ElevatedButton(
                                  onPressed: () {
                                    _showBottomSheet(
                                        context); // แสดง Bottom Sheet
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        Color.fromARGB(255, 243, 243, 243),
                                    elevation: 0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                  ),
                                  child: Row(
                                    children: [
                                      Icon(Icons.attach_money_outlined,
                                          color: Colors.green),
                                      SizedBox(width: 8),
                                      Text("เงินสด",
                                          style: TextStyle(
                                              color: Colors.green,
                                              fontSize: 12)),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(width: 12),
                              // ปุ่มที่สอง
                              Expanded(
                                child: ElevatedButton(
                                  onPressed: () {
                                    ModalUtils.showModal(
                                        context); // เรียกแสดง Modal
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        Color.fromARGB(255, 243, 243, 243),
                                    elevation: 0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                  ),
                                  child: Row(
                                    children: [
                                      Icon(Icons.watch_later_outlined,
                                          color: Colors.green),
                                      SizedBox(width: 8),
                                      Text("ตอนนี้",
                                          style: TextStyle(
                                              color: Colors.green,
                                              fontSize: 12)),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        // 3 รูปภาพที่มี Title และ Description
                        Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Row(
                            mainAxisAlignment:
                                MainAxisAlignment.start, // ช่วยให้การ์ดชิดกลาง
                            children: [
                              // Card 1
                              _buildCard(context, "รถยนตร์", "เริ่มต้น ฿ 45",
                                  "assets/logo/maxim.png"),
                              SizedBox(width: 10), // ระยะห่างระหว่างการ์ด
                              // Card 2
                              _buildCard(context, "มอเตอร์ไซค์",
                                  "เริ่มต้น ฿ 25", "assets/logo/maxim.png"),
                              SizedBox(width: 10),
                              // Card 3
                              _buildCard(context, "การจัดส่ง", "เริ่มต้น ฿ 25",
                                  "assets/logo/maxim.png"),
                            ],
                          ),
                        ),

                        // เพิ่ม padding เพื่อให้ปุ่มไม่ติดขอบ
                        Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: SizedBox(
                            width: double.infinity,
                            height: 40, // ตั้งค่าความสูงของปุ่ม
                            child: ElevatedButton(
                              onPressed: () {
                                print("ดำเนินการต่อ");
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    Color.fromARGB(255, 255, 206, 59),
                              ),
                              child: Text(
                                "เรียกรถ",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 12),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

void _showBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true, // เพื่อให้สูงตามที่เราต้องการ
    backgroundColor: Colors.white, // พื้นหลังเป็นสีขาว
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
    ),
    builder: (BuildContext context) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // ติ่งกลางบ่งบอกว่าเลื่อนลงได้
            Container(
              width: 40,
              height: 5,
              margin: const EdgeInsets.only(bottom: 8),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            // รายการที่ 1: Icon + Text
            ListTile(
              leading: Icon(Icons.attach_money, color: Colors.green),
              title: Text('เงินสด'),
              onTap: () {
                // Logic เมื่อคลิก
                Navigator.pop(context); // ปิด Bottom Sheet
                print('เงินสด');
              },
            ),

            // รายการที่ 2: Icon + Text + SubText + Icon ขวา
            ListTile(
              leading: Icon(Icons.credit_card, color: Colors.blue),
              title: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'บัญชี ',
                      style: TextStyle(
                          color: Colors.black), // สีของข้อความ 'บัญชี'
                    ),
                    TextSpan(
                      text: '\฿0',
                      style: TextStyle(color: Colors.red),
                    ),
                  ],
                ),
              ),
              subtitle: Text('+669999999'),
              trailing: Icon(Icons.info_outline, color: Colors.grey),
              onTap: () {
                // Logic เมื่อคลิก
                Navigator.pop(context); // ปิด Bottom Sheet
                // ไปที่ลิ้งค์หรือหน้าต่างใหม่
                print('ไปยังหน้าบัตรเครดิต');
              },
            )
          ],
        ),
      );
    },
  );
}

Widget _buildCard(
    BuildContext context, String title, String price, String imagePath) {
  return SizedBox(
    width: 90, // กำหนดความกว้างของ Card
    height: 100, // กำหนดความสูงของ Card
    child: GestureDetector(
      onTap: () {
        // เรียกใช้ switch case เช็คชื่อการ์ดแล้วเปิด BottomSheet
        switch (title) {
          case "รถยนตร์":
            showModalBottomSheet(
              context: context,
              builder: (BuildContext context) {
                Navigator.pop(context); // ปิด bottom sheet
                return BottomSheetWidget(); // เรียกใช้ BottomSheetWidget
              },
            );
            break;
          case "มอเตอร์ไซค์":
            showModalBottomSheet(
              context: context,
              builder: (BuildContext context) {
                Navigator.pop(context); // ปิด bottom sheet
                return BottomSheetWidget(); // เรียกใช้ BottomSheetWidget
              },
            );
            break;
          case "การจัดส่ง":
            showModalBottomSheet(
              context: context,
              builder: (BuildContext context) {
                Navigator.pop(context); // ปิด bottom sheet
                return BottomSheetWidget(); // เรียกใช้ BottomSheetWidget
              },
            );
            break;
          default:
            print("กรุณาเลือกการ์ด");
            break;
        }
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        color: Colors.blue[100],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // จัดให้อยู่ตรงกลางการ์ด
          children: [
            Image.asset(
              imagePath,
              height: 40, // ปรับขนาดรูปภาพ
              fit: BoxFit.contain, // ป้องกันรูปภาพเกินขอบ
            ),
            SizedBox(height: 4), // เพิ่มระยะห่างระหว่างรูปกับข้อความ
            Text(
              title,
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            ),
            Text(
              price,
              style: TextStyle(fontSize: 10),
            ),
          ],
        ),
      ),
    ),
  );
}
