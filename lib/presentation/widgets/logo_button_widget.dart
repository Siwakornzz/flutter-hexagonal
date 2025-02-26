import 'package:flutter/material.dart';

class LogoButtonWidget extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressed;

  const LogoButtonWidget({
    Key? key,
    required this.buttonText,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          MainAxisAlignment.spaceBetween, // เพิ่มระยะห่างระหว่างโลโก้และปุ่ม
      children: [
        // Logo อยู่ด้านซ้าย
        Padding(
          padding: const EdgeInsets.all(2.0),
          child: Image.asset(
            'assets/logo/maxim.png',
            width: 80, // ขนาดของโลโก้
          ),
        ),
        // Button อยู่ด้านขวา
        TextButton(
          onPressed: onPressed,
          child: Text(
            buttonText,
            style: TextStyle(color: const Color.fromARGB(255, 30, 66, 31), fontSize: 12),
          ),
        ),
      ],
    );
  }
}
