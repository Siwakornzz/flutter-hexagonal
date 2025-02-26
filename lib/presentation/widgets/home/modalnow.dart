import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ModalUtils {
  // ฟังก์ชันแสดง Modal
  static void showModal(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          backgroundColor: Colors.white, // กำหนดพื้นหลังให้เป็นสีขาว
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min, // ใช้ขนาดที่เหมาะสม
              children: [
                // Header สำหรับ Modal
                Text(
                  'ออเดอร์ล่วงหน้า',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Divider(thickness: 1.5, color: Colors.grey), // Divider

                // Cupertino DatePicker (วัน, เดือน, ชั่วโมง, นาที)
                Container(
                  height: 250, // กำหนดขนาดให้พอดี
                  child: CupertinoDatePicker(
                    initialDateTime: DateTime.now()
                        .add(Duration(minutes: 20)), // บวก 20 นาที
                    mode: CupertinoDatePickerMode.dateAndTime,
                    onDateTimeChanged: (DateTime newDateTime) {
                      // ฟังก์ชันเมื่อวันที่ถูกเลือก
                    },
                    use24hFormat: true, // ใช้ 24 ชั่วโมง (ไม่ใช้ AM/PM)
                    minuteInterval: 1, // เลือกทุกนาที
                    minimumDate: DateTime.now(), // กำหนดไม่ให้เลือกวันก่อนหน้า
                  ),
                ),

                // Footer ที่มี 3 ข้อความ
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context); // ยกเลิก modal
                      },
                      child:
                          Text('ตอนนี้', style: TextStyle(color: Colors.blue)),
                    ),
                    Row(
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context); // ยกเลิก modal
                          },
                          child: Text('ยกเลิก',
                              style: TextStyle(color: Colors.blue)),
                        ),
                        SizedBox(width: 10),
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context); // ตกลง modal
                          },
                          child: Text('ตกลง',
                              style: TextStyle(color: Colors.blue)),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
