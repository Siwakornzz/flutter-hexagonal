import 'package:flutter/material.dart';
import 'package:hexagonal_research_develop/presentation/pages/fav_screen.dart';
import 'package:hexagonal_research_develop/presentation/pages/menu_scrreen.dart';
import 'package:hexagonal_research_develop/presentation/pages/order_screen.dart';
import 'package:hexagonal_research_develop/presentation/widgets/bottom_bar_widget.dart';
import 'package:hexagonal_research_develop/presentation/widgets/home/home.dart';

class HomePage extends StatefulWidget {
  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<HomePage> {
  int _selectedIndex = 0;

  // ฟังก์ชั่นนี้ใช้ในการเปลี่ยนหน้า
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // ฟังก์ชั่นนี้เพื่อแสดงหน้า content ตาม index
  Widget _getPage(int index) {
    switch (index) {
      case 0:
        return HomePageWidget();
      case 1:
        return OrderScreen();
      case 2:
        return FavScreen();
      case 3:
        return MenuScreen();
      default:
        return HomePageWidget();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex, // เลือกหน้าโดยใช้ _selectedIndex
        children: [
          _getPage(0), // หน้าแรก
          _getPage(1), // ออเดอร์
          _getPage(2), // รายการโปรด
          _getPage(3), // เมนู
        ],
      ),
      bottomNavigationBar: BottomBarWidget(
        selectedIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
