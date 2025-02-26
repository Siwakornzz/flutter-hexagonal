import 'package:flutter/material.dart';

class Regsister1Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text('Left Right Text & List')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Text Left - Button Right
            SizedBox(height: 20), // เพิ่มระยะห่างด้านบน

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "เลือกเมือง",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => NewPage()),
                    );
                  },
                  child: Text(
                    "ไทย",
                    style: TextStyle(
                        color: const Color.fromARGB(255, 26, 103, 166),
                        fontSize: 14),
                  ),
                ),
              ],
            ),
            SizedBox(height: 18),

            // TextBox
            TextField(
              decoration: InputDecoration(
                labelText: "ค้นหา",
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
                    vertical: 10, horizontal: 10), // ปรับขนาดความสูงภายใน
              ),
            ),

            // ListView
            Expanded(
              child: ListView.builder(
                itemCount: 10, // จำนวน item
                itemBuilder: (context, index) {
                  return ListTile(
                    // leading: Icon(Icons.list),
                    title: Text("รายการที่ ${index + 1}"),
                    subtitle: Text("รายละเอียดรายการที่ ${index + 1}"),
                    onTap: () {
                      print("กดรายการที่ ${index + 1}");
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("หน้าใหม่")),
      body: Center(child: Text("นี่คือหน้าใหม่!")),
    );
  }
}
