import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:my_chat/modules/auth/presentation/screens/login_screen.dart';
import 'package:my_chat/shared/local/shared_prefrence.dart';
import 'package:my_chat/shared/network/dio_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  DioHelper.init();
  // MyChatSharedPrefrence.setBool("islogedin", false);
  runApp(
    DevicePreview(
      enabled: false,
      builder: (context) => const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      darkTheme: ThemeData.dark(),
      theme: ThemeData(
        errorColor: Colors.redAccent,
        appBarTheme: const AppBarTheme(
          elevation: 0,
          backgroundColor: Colors.transparent,
          titleTextStyle: TextStyle(
            color: Colors.white,
          ),
          actionsIconTheme: IconThemeData(
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color(0xff173a05),
        accentColor: Colors.white,
        buttonColor: const Color(0xFFCCCCCC),
        textTheme: TextTheme(headline4: TextStyle(fontSize: 20,color: Colors.white),),
        splashColor: const Color(0xFF755F5F),
        accentTextTheme: const TextTheme(
          button: TextStyle(
            fontSize: 20,
            color: Color(
              0xFF6E6E6E,
            ),
          ),
        ),
      ),
      // home: MyChatSharedPrefrence.get("islogedin") ? LoginScreen() : LoginScreen(),
      home: const LoginScreen(),
    );
  }
}
