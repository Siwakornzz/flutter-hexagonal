import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MapWithBottomSheet extends StatefulWidget {
  @override
  _MapWithBottomSheetState createState() => _MapWithBottomSheetState();
}

class _MapWithBottomSheetState extends State<MapWithBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                FlutterMap(
                  options: MapOptions(
                    initialCenter: LatLng(13.7563, 100.5018), // พิกัดกรุงเทพ
                    initialZoom: 13.0,
                  ),
                  children: [
                    TileLayer(
                      urlTemplate:
                          "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                      subdomains: ['a', 'b', 'c'],
                    ),
                    MarkerLayer(
                      markers: [
                        Marker(
                          point: LatLng(13.7563, 100.5018), // พิกัดกรุงเทพ
                          width: 40.0,
                          height: 40.0,
                          child: Icon(Icons.location_on,
                              color: Colors.red, size: 40),
                        ),
                      ],
                    ),
                  ],
                ),
                Positioned(
                  top: 25, // ระยะจากขอบบน
                  left: 10,
                  right: 10,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      color: Colors.white, // พื้นหลังให้มองเห็น
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(color: Colors.black26, blurRadius: 4),
                      ],
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "กรอกที่อยู่เพื่อค้นหา",
                        prefixIcon: IconButton(
                          icon: Icon(Icons.arrow_back_ios, size: 18),
                          onPressed: () {
                            Navigator.pop(context); // กลับไปหน้าก่อนหน้า
                          },
                        ),
                        border: InputBorder.none, // เอาขอบออกให้ดูเนียน
                      ),
                    ),
                  ),
                ),
                // **Fixed** Bottom Sheet อยู่ค้างตลอด
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: 250, // กำหนดความสูงของ Bottom Sheet
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20)),
                      boxShadow: [BoxShadow(blurRadius: 5)],
                    ),
                    child: Column(
                      children: [
                        // Header สำหรับ Bottom Sheet
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("จาก",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold)),
                              // Floating Button ที่อยู่ในระดับเดียวกับ Header
                              FloatingActionButton(
                                onPressed: () {
                                  // สามารถเพิ่ม logic ที่ต้องการได้
                                },
                                backgroundColor: Colors.blue,
                                child: Icon(Icons.add_location,
                                    color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                        Divider(),
                        // ตัวเลือกเดียวใน List
                        ListTile(
                          leading: Icon(Icons.location_on),
                          title: Text('ตัวเลือกเดียว'),
                          subtitle: Text('คำอธิบายตัวเลือกเดียว'),
                          onTap: () {
                            // ปิด Bottom Sheet
                          },
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
    );
  }
}
