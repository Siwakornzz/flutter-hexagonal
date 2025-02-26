import 'package:flutter/material.dart';

class BottomBarWidget extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTap;

  BottomBarWidget({required this.selectedIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: selectedIndex,
      onTap: onTap,
      iconSize: 22, // ลดขนาด icon เพื่อลดความแออัด
      backgroundColor: Colors.white,
      selectedItemColor: Colors.black, // สีของไอคอนและข้อความที่เลือก
      unselectedItemColor: Colors.grey, // สีของไอคอนและข้อความที่ไม่ได้เลือก
      type: BottomNavigationBarType.fixed, // ทำให้ label แสดงอยู่ตลอดเวลา
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.bubble_chart),
          label: 'หน้าแรก',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.production_quantity_limits_rounded),
          label: 'ออเดอร์',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.star_border),
          label: 'รายการโปรด',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.short_text_outlined),
          label: 'เมนู',
        ),
      ],
    );
  }
}
