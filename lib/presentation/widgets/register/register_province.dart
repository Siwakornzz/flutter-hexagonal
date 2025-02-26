import 'package:flutter/material.dart';
import 'package:hexagonal_research_develop/presentation/pages/register_screen.dart';
import 'package:hexagonal_research_develop/presentation/widgets/register/register_country.dart';

class RegisterProvinceScreen extends StatefulWidget {
  @override
  _RegisterProvinceScreenState createState() => _RegisterProvinceScreenState();
}

class _RegisterProvinceScreenState extends State<RegisterProvinceScreen> {
  final List<Map<String, String>> items = [
    {"district": "อำเภอเมือง", "province": "เชียงใหม่"},
    {"district": "อำเภอหางดง", "province": "เชียงใหม่"},
    {"district": "อำเภอแม่ริม", "province": "เชียงใหม่"},
    {"district": "อำเภอเมือง", "province": "กรุงเทพมหานคร"},
    {"district": "อำเภอปทุมวัน", "province": "กรุงเทพมหานคร"},
  ];

  TextEditingController searchController = TextEditingController();
  FocusNode searchFocusNode = FocusNode(); // ➊ สร้าง FocusNode
  List<Map<String, String>> filteredItems = [];

  @override
  void initState() {
    super.initState();
    filteredItems = items;
    Future.delayed(Duration(milliseconds: 300), () {
      FocusScope.of(context)
          .requestFocus(searchFocusNode); // ➋ สั่งโฟกัสตอนเปิดหน้า
    });
  }

  @override
  void dispose() {
    searchFocusNode.dispose(); // ➌ ล้าง focusNode เมื่อปิดหน้า
    super.dispose();
  }

  void filterSearchResults(String query) {
    if (query.isEmpty) {
      setState(() {
        filteredItems = items;
      });
      return;
    }

    setState(() {
      filteredItems = items
          .where((item) =>
              item['district']!.toLowerCase().contains(query.toLowerCase()) ||
              item['province']!.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  void onItemClicked(String district, String province) {
    // ฟังก์ชันที่จะทำเมื่อคลิกที่รายการ
    print('คลิกที่: $district, $province');
    // ตัวอย่างการนำทาง
    // Navigator.push(context, MaterialPageRoute(builder: (context) => DetailsPage(district, province)));

    Navigator.push(
        context, MaterialPageRoute(builder: (context) => RegisterPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 28, horizontal: 18),
            child: Column(
              children: [
                // Row ที่มีข้อความซ้ายขวา
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      // IconButton(
                      //   icon: Icon(Icons.arrow_back_ios_sharp),
                      //   onPressed: () {
                      //     Navigator.pop(context);
                      //   },
                      //   padding: EdgeInsets.zero, // ลดระยะห่างในไอคอน
                      // ),
                      Text(
                        'เลือกเมือง',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                      Spacer(), // ขยับข้อความ "ไทย" ให้ชิดขวาสุด
                      InkWell(
                        onTap: () {
                          print('Right text clicked!');
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RegisterCountryScreen()),
                          );
                        },
                        child: Text(
                          'ไทย',
                          style: TextStyle(color: Colors.blue),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(
                  height: 12,
                ),
                // TextField สำหรับค้นหา
                TextField(
                  controller: searchController,
                  focusNode: searchFocusNode,
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    labelText: "ค้นหา",
                    labelStyle: TextStyle(color: Colors.grey),
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
                      ),
                    ),
                    contentPadding: EdgeInsets.symmetric(
                        vertical: 2, horizontal: 10), // ปรับขนาดความสูงภายใน
                  ),
                  onChanged: filterSearchResults,
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.grey[100], // เปลี่ยนสีพื้นหลังทั้งหมด
              child: ListView.separated(
                itemCount: filteredItems.length,
                separatorBuilder: (context, index) => Divider(),
                itemBuilder: (context, index) {
                  return Container(
                    height: 60, // กำหนดความสูงที่ต้องการ
                    child: ListTile(
                      dense: true,
                      onTap: () {
                        onItemClicked(
                          filteredItems[index]['district']!,
                          filteredItems[index]['province']!,
                        );
                      },
                      title: Text(
                        filteredItems[index]['district']!,
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w500),
                      ),
                      subtitle: Text(
                        filteredItems[index]['province']!,
                        style: TextStyle(fontSize: 12, color: Colors.grey[700]),
                      ),
                    ),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
