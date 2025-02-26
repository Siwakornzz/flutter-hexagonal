import 'package:flutter/material.dart';
import 'package:hexagonal_research_develop/presentation/widgets/logo_button_widget.dart';

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
            LogoButtonWidget(
                buttonText: "สุราษฎร์ธานี",
                onPressed: () {
                  // กดแล้วทำอะไร
                }),
            TextFormField(
                controller: controller2,
                decoration: InputDecoration(
                    filled: true, // ให้ TextField มีพื้นหลัง
                    fillColor: Colors.grey[200], // สีพื้นหลังของ TextField
                    labelText: 'เดินทางจาก',
                    labelStyle: TextStyle(color: Colors.black, fontSize: 13),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      borderSide: BorderSide(
                          color:
                              Colors.transparent), // สำหรับกรณีที่ไม่ได้ focus
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      borderSide: BorderSide(
                          color:
                              Colors.transparent), // สำหรับกรณีที่ไม่ได้ focus
                    ),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                    suffixIcon: Icon(Icons.keyboard_arrow_right_outlined),
                    prefixIcon: Icon(Icons.circle_outlined),
                    prefixIconColor: Colors.red)),
            SizedBox(height: 7),
            TextFormField(
              controller: controller2,
              decoration: InputDecoration(
                  filled: true, // ให้ TextField มีพื้นหลัง
                  fillColor: Colors.grey[200], // สีพื้นหลังของ TextField
                  labelText: 'ไปที่',
                  labelStyle: TextStyle(color: Colors.black, fontSize: 13),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide: BorderSide(
                        color: Colors.transparent), // สำหรับกรณีที่ไม่ได้ focus
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide: BorderSide(
                        color: Colors.transparent), // สำหรับกรณีที่ไม่ได้ focus
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                  suffixIcon: Icon(Icons.keyboard_arrow_right_outlined),
                  prefixIcon: Icon(Icons.circle_outlined),
                  prefixIconColor: const Color.fromARGB(255, 89, 134, 92)),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter, // จัดให้ Card อยู่ล่างสุด
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(2.0),
                  ),
                  color: Colors.white, // สีพื้นหลังของ Card
                  child: SizedBox(
                    width: 500,
                    height: 300,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment
                          .spaceBetween, // ให้เนื้อหาเว้นระยะห่าง
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  print("รายละเอียด");
                                  // Navigator.pushReplacementNamed(
                                  //     context, "/registerverifyotp");
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      Color.fromARGB(255, 243, 243, 243),
                                  elevation:
                                      0, // ตั้งค่า elevation เป็น 0 เพื่อปิดเงา
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        12.0), // ใส่ขนาดของ radius ที่ต้องการ
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(
                                      Icons.account_tree_outlined,
                                      color:
                                          const Color.fromARGB(255, 25, 64, 27),
                                    ), // ไอคอนของรถ
                                    SizedBox(
                                        width:
                                            8), // เพิ่มระยะห่างระหว่างไอคอนและข้อความ
                                    Text(
                                      "รายละเอียด",
                                      style: TextStyle(
                                          color: const Color.fromARGB(
                                              255, 25, 64, 27),
                                          fontSize: 12),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 2),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment
                                      .spaceBetween, // จัดปุ่มให้ห่างกัน
                                  children: [
                                    // ปุ่มแรก
                                    Expanded(
                                      child: ElevatedButton(
                                        onPressed: () {
                                          print("ดำเนินการต่อ");
                                          // Navigator.pushReplacementNamed(
                                          //     context, "/registerverifyotp");
                                        },
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Color.fromARGB(
                                              255, 243, 243, 243),
                                          elevation: 0, // ปิดเงา
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                                12.0), // ใส่ขนาดของ radius ที่ต้องการ
                                          ),
                                        ),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment
                                              .start, // จัดให้อยู่กลาง
                                          children: [
                                            Icon(
                                              Icons.attach_money_outlined,
                                              color: const Color.fromARGB(
                                                  255, 89, 134, 92),
                                            ), // ไอคอนของรถ
                                            SizedBox(width: 8),
                                            Text(
                                              "เงินสด",
                                              style: TextStyle(
                                                  color: const Color.fromARGB(
                                                      255, 89, 134, 92),
                                                  fontSize: 12),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 12),
                                    // ปุ่มที่สอง
                                    Expanded(
                                      child: ElevatedButton(
                                        onPressed: () {
                                          print("ดำเนินการต่อ");
                                          // Navigator.pushReplacementNamed(
                                          //     context, "/registerverifyotp");
                                        },
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Color.fromARGB(
                                              255, 243, 243, 243),
                                          elevation: 0, // ปิดเงา
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                                12.0), // ใส่ขนาดของ radius ที่ต้องการ
                                          ),
                                        ),
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.watch_later_outlined,
                                              color: const Color.fromARGB(
                                                  255, 89, 134, 92),
                                            ), // ไอคอนของรถ
                                            SizedBox(width: 8),

                                            Text(
                                              "ตอนนี้",
                                              style: TextStyle(
                                                  color: const Color.fromARGB(
                                                      255, 89, 134, 92),
                                                  fontSize: 12),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(
                              12.0), // เพิ่ม padding เพื่อให้ปุ่มไม่ติดขอบ
                          child: SizedBox(
                            width:
                                double.infinity, // ปรับให้ปุ่มกว้างเต็มขอบ Card
                            height: 44, // ตั้งค่าความสูงของปุ่ม
                            child: ElevatedButton(
                              onPressed: () {
                                print("ดำเนินการต่อ");
                                // Navigator.pushReplacementNamed(
                                //     context, "/registerverifyotp");
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color.fromARGB(
                                    255, 255, 206, 59), // เปลี่ยนสีปุ่ม
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
            ),
          ],
        ),
      ),
    );
  }
}
