import 'package:flutter/material.dart';

class RegisterCountryScreen extends StatefulWidget {
  @override
  _RegisterCountryScreenState createState() => _RegisterCountryScreenState();
}

class _RegisterCountryScreenState extends State<RegisterCountryScreen> {
  final List<Map<String, String>> items = [
    {"country": "ไทย", "code": "+66", "icon": "🇹🇭"},
    {"country": "ญี่ปุ่น", "code": "+81", "icon": "🇯🇵"},
    {"country": "สหรัฐอเมริกา", "code": "+1", "icon": "🇺🇸"},
    {"country": "อังกฤษ", "code": "+44", "icon": "🇬🇧"},
    {"country": "เยอรมนี", "code": "+49", "icon": "🇩🇪"},
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
              item['country']!.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  void onItemClicked(String country, String code) {
    // ฟังก์ชันที่จะทำเมื่อคลิกที่รายการ
    print('คลิกที่: $country, Code: $code');
    // ตัวอย่างการนำทาง
    // Navigator.push(context, MaterialPageRoute(builder: (context) => DetailsPage(district, country)));
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'เลือกประเทศ',
          style: TextStyle(fontSize: 14),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_sharp),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          // ใส่ Padding เฉพาะ Search Box
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
            child: TextField(
              controller: searchController,
              focusNode: searchFocusNode,
              decoration: InputDecoration(
                labelText: "ค้นหา",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                  borderSide: BorderSide(color: Colors.grey),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                  borderSide: BorderSide(
                    color: const Color.fromARGB(255, 255, 206, 59),
                  ),
                ),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              ),
              onChanged: filterSearchResults,
            ),
          ),
          // เอา Expanded ออกมานอก Padding
          Expanded(
            child: Container(
              color: Colors.grey[100], // เปลี่ยนสีพื้นหลังทั้งหมด
              child: ListView.separated(
                itemCount: filteredItems.length,
                separatorBuilder: (context, index) => Divider(),
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () {
                      onItemClicked(
                        filteredItems[index]['country']!,
                        filteredItems[index]['code']!,
                      );
                    },
                    leading: Text(
                      filteredItems[index]['icon']!,
                      style: TextStyle(fontSize: 30),
                    ),
                    title: Text(
                      filteredItems[index]['country']!,
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                    ),
                    trailing: Text(
                      filteredItems[index]['code']!,
                      style: TextStyle(fontSize: 12, color: Colors.grey[700]),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
