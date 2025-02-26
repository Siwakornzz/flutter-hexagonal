import 'package:flutter/material.dart';
import 'package:hexagonal_research_develop/presentation/widgets/logo_button_widget.dart';

class FavScreen extends StatefulWidget {
  @override
  _FavScreenState createState() => _FavScreenState();
}

class _FavScreenState extends State<FavScreen> {
  bool isExpanded = false; // เช็คสถานะปุ่ม ( + หรือ x )

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 14),
        child: Column(
          children: [
            LogoButtonWidget(
              buttonText: "สุราษฎร์ธานี",
              onPressed: () {},
            ),
            Expanded(
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      "assets/logo/maxim.png",
                      height: 120,
                    ),
                    SizedBox(height: 8),
                    Text('เส้นทางและที่อยู่โปรดของคุณอยู่ที่นี่'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Stack(
        clipBehavior: Clip.none,
        children: [
          // ถ้า isExpanded เป็น true จะโชว์ปุ่ม A และ B
          if (isExpanded) ...[
            _buildOption(
              Icons.location_on,
              "ที่อยู่",
              Colors.black,
              115,
              () {
                print("กดที่อยู่");
                setState(() {
                  isExpanded = false;
                });
              },
            ),
            _buildOption(
              Icons.ramp_left_outlined,
              "เส้นทาง",
              Colors.black,
              80,
              () {
                print("กดเส้นทาง");
                setState(() {
                  isExpanded = false;
                });
              },
            ),
          ],

          // ปุ่มกด + หรือ x
          FloatingActionButton(
            elevation: 1,
            onPressed: () {
              setState(() {
                isExpanded = !isExpanded;
              });
            },
            backgroundColor: const Color.fromARGB(255, 255, 196, 59),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Icon(
              isExpanded ? Icons.close : Icons.add,
              color: Colors.black,
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  // สร้างปุ่มตัวเลือก A และ B (Icon และ Text แยกกรอบกัน)
  Widget _buildOption(IconData icon, String text, Color color, double bottom,
      VoidCallback onTap) {
    return Positioned(
      right: 10,
      bottom: bottom,
      child: Visibility(
        visible: isExpanded,
        child: Material(
          // <<< หุ้มด้วย Material เพื่อให้รับสัมผัส
          color: Colors.transparent, // ทำให้พื้นหลังโปร่งใส
          child: InkWell(
            onTap: onTap, // <<< ใช้ InkWell แทน GestureDetector
            borderRadius: BorderRadius.circular(10),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                // กรอบของ Text
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        spreadRadius: 1,
                        blurRadius: 8,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Text(
                    text,
                    style: TextStyle(
                        color: color,
                        fontWeight: FontWeight.bold,
                        fontSize: 14),
                  ),
                ),
                SizedBox(width: 8),

                // กรอบของ Icon
                Container(
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        spreadRadius: 2,
                        blurRadius: 8,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Icon(icon, color: Colors.green[800], size: 14),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
