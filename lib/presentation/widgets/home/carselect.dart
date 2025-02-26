import 'package:flutter/material.dart';

class BottomSheetWidget extends StatefulWidget {
  @override
  _BottomSheetWidgetState createState() => _BottomSheetWidgetState();
}

class _BottomSheetWidgetState extends State<BottomSheetWidget> {
  final List<Map<String, dynamic>> items = [
    {
      "title": "รถยนต์",
      "description":
          "สำหรับการเดินทางแบบรายวัน สามารถรองรับผู้โดยสารได้สูงสุดถึง 4 ท่าน ค่าเดินทางไม่รวมค่าทางด่วน, ที่จอดรถ หรือค่าธรรมเนียมเพิ่มเติมอื่นๆ รถยนต์ที่มีกำลังเครื่องยนต์ตั้งแต่ 50 ถึง 90 kW",
      "price": 45
    },
    {
      "title": "Car Plus",
      "description":
          "ความสบายขั้นสูง รถยนต์ที่มีความจุเครื่องยนต์ตั้งแต่ 90-120 kW",
      "price": 50
    },
    {"title": "รายการที่ 3", "description": "คำอธิบาย 3", "price": 55},
    {"title": "รายการที่ 4", "description": "คำอธิบาย 4", "price": 60},
  ];

  final List<bool> _checkboxValues = List.generate(4, (index) => index == 0);

  void _showBottomSheetCar(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isDismissible: true,
      enableDrag: true,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // ติ่งกลางจอ
                    Container(
                      width: 40,
                      height: 5,
                      margin: const EdgeInsets.only(bottom: 8),
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),

                    // Header
                    Row(
                      children: [
                        Image.asset(
                          "assets/logo/maxim.png",
                          height: 40,
                          fit: BoxFit.contain,
                        ),
                        SizedBox(width: 8),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "รถยนต์",
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                            Text(
                              "เลือกเรทราคาได้มากกว่าหนึ่งประเภท ออเดอร์จะเข้าถึงคนขับวงกว้างขึ้น",
                              style:
                                  TextStyle(fontSize: 10, color: Colors.grey),
                            ),
                          ],
                        ),
                      ],
                    ),

                    // ListView มี marginTop
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(
                          top: 8,
                        ), // Margin ด้านบน
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: items.length,
                          itemBuilder: (BuildContext context, int index) {
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  _checkboxValues[index] =
                                      !_checkboxValues[index];
                                });
                              },
                              child: Container(
                                margin: EdgeInsets.only(
                                    bottom:
                                        10), // เพิ่มระยะห่างระหว่างแต่ละรายการ
                                decoration: BoxDecoration(
                                  color: Colors.white, // สี background
                                  borderRadius:
                                      BorderRadius.circular(12), // มนขึ้น
                                  border: Border.all(
                                    color: _checkboxValues[index]
                                        ? Colors.orange
                                        : Colors.transparent,
                                    width: 2, // ความหนาของเส้นขอบ
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.1),
                                      blurRadius: 6,
                                      spreadRadius: 2,
                                      offset: Offset(0, 2),
                                    ),
                                  ],
                                ),
                                child: ListTile(
                                  leading: Checkbox(
                                    value: _checkboxValues[index],
                                    onChanged: (bool? value) {
                                      setState(() {
                                        _checkboxValues[index] = value ?? false;
                                      });
                                    },
                                    activeColor:
                                        Colors.green[700], // สีเขียวแก่
                                  ),
                                  title: Text(
                                    items[index]['title'],
                                    style: TextStyle(fontSize: 12),
                                  ),
                                  subtitle: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 12),
                                    child: Column(
                                      // ใช้ Column แทน Row เพื่อจัดข้อความให้อยู่ในแนวตั้ง
                                      crossAxisAlignment: CrossAxisAlignment
                                          .start, // ให้ข้อความชิดซ้าย
                                      children: [
                                        // ข้อความ description ที่สามารถ wrap ได้
                                        Text(
                                          items[index]['description'],
                                          style: TextStyle(fontSize: 10),
                                          softWrap:
                                              true, // อนุญาตให้ข้อความตัดบรรทัด
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Text(
                                              "เริ่มต้น ฿ ${items[index]['price']}",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            IconButton(
                                              onPressed: () {},
                                              icon: Icon(
                                                Icons.info_outline,
                                                color: const Color.fromARGB(
                                                    255, 5, 56, 31),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),

                    // ปุ่มตกลง
                    Padding(
                      padding: const EdgeInsets.only(top: 4.0, bottom: 10),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text("ตกลง"),
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(double.infinity, 50),
                          backgroundColor: Colors.orangeAccent,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      if (mounted) {
        _showBottomSheetCar(context);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox();
  }
}
