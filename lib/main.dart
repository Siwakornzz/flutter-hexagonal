import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hexagonal_research_develop/core/infrastructure/theme/app_theme.dart';
import 'package:hexagonal_research_develop/presentation/pages/home_screen.dart';
import 'package:hexagonal_research_develop/presentation/pages/login_screen.dart';
import 'package:hexagonal_research_develop/presentation/pages/register_screen.dart';
import 'package:hexagonal_research_develop/presentation/pages/register_verify_otp_screen.dart';
import 'package:hexagonal_research_develop/presentation/pages/regsister_1_screen..dart';
import 'package:hexagonal_research_develop/presentation/widgets/register/register_country.dart';
import 'package:hexagonal_research_develop/presentation/widgets/register/register_province.dart';
import 'presentation/pages/splash_screen.dart';

void main() async {
  // WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  await dotenv.load(fileName: ".env"); // โหลด Config
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter App',
      theme: AppTheme.lightTheme,
      initialRoute: "/", // หน้าแรก
      routes: {
        "/": (context) => SplashScreen(),
        "/login": (context) => LoginPage(),
        "/preRegisterProvince": (context) => RegisterProvinceScreen(),
        "/preRegisterCountry": (context) => RegisterCountryScreen(),
        "/register1": (context) => Regsister1Screen(),
        "/register": (context) => RegisterPage(),
        "/registerverifyotp": (context) => RegisterVerifyOTPScreen(),
        "/home": (context) => HomePage(),
      },
    );
  }
}
