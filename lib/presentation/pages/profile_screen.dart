import 'package:flutter/material.dart';
import 'package:hexagonal_research_develop/presentation/widgets/list_item_widget.dart';
import 'package:quickalert/quickalert.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // ฟังก์ชันที่แสดง Alert เพื่อยืนยันการออกจากระบบ
  void _showLogoutAlert() {
    QuickAlert.show(
      context: context,
      type: QuickAlertType.confirm,
      text: 'Do you want to logout?',
      confirmBtnText: 'Yes',
      cancelBtnText: 'No',
      confirmBtnColor: Colors.orange,
      onConfirmBtnTap: () {
        Navigator.pop(context); // ปิด Alert
        _logout(); // ทำการ Logout
      },
    );
  }

  // ฟังก์ชัน Logout
  void _logout() {
    // ทำสิ่งที่ต้องการตอน Logout เช่น กลับไปหน้า Login
    Navigator.pushReplacementNamed(context, "/login"); // กลับไปหน้า Login
  }

  // ฟังก์ชันที่เรียกใช้เมื่อกดรายการ
  void _onItemPressed(int index) {
    print("Item $index pressed");
  }

  @override
  Widget build(BuildContext context) {
    // ข้อมูลรายการใน List
    List<ListItem> items = [
      ListItem(
          icon: Icons.phone,
          title: 'โทรศัพท์',
          subtitle: '+66 99 999 9999',
          onPressed: () => _onItemPressed(1)),
      ListItem(
          icon: Icons.person,
          title: 'ชื่อ',
          subtitle: 'ไม่กำหนด',
          onPressed: () => _onItemPressed(2)),
      ListItem(
          icon: Icons.wc,
          title: 'เพศ',
          subtitle: 'ไม่กำหนด',
          onPressed: () => _onItemPressed(3)),
      ListItem(
          icon: Icons.calendar_month_outlined,
          title: 'วันเกิด',
          subtitle: 'ไม่กำหนด',
          onPressed: () => _onItemPressed(4)),
      ListItem(
          icon: Icons.email,
          title: 'อีเมล',
          subtitle: 'ไม่กำหนด',
          onPressed: () => _onItemPressed(5)),
    ];

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight + 1),
        child: Column(
          children: [
            AppBar(
              title: Text("โปรไฟล์", style: TextStyle(fontSize: 16)),
              automaticallyImplyLeading: false,
              leading: IconButton(
                icon: Icon(Icons.arrow_back_ios, size: 18),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              actions: [
                IconButton(
                  icon: Icon(Icons.logout, color: Colors.green[800], size: 18),
                  onPressed: _showLogoutAlert,
                ),
              ],
              elevation: 0,
              backgroundColor: Colors.white,
            ),
            Container(
              height: 1,
              width: double.infinity,
              color: Colors.grey,
            ),
          ],
        ),
      ),
      body: Container(
        color: Colors.grey[200],
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: ListView.builder(
          itemCount: items.length, // จำนวนรายการใน List
          itemBuilder: (context, index) {
            // ใช้ข้อมูลจาก items เพื่อสร้าง ListItemWidget
            return ListItemWidget(
              icon: items[index].icon,
              title: items[index].title,
              subtitle: items[index].subtitle,
              onPressed: items[index].onPressed,
            );
          },
        ),
      ),
    );
  }
}
