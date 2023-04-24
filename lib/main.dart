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
      enabled: true,
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
      darkTheme: ThemeData(
        errorColor: const Color(0xffFF7751),
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
        iconTheme: IconThemeData(color: Colors.white),
        bottomSheetTheme: BottomSheetThemeData(
          backgroundColor: const Color(0xff2D343C),
          modalBackgroundColor: const Color(0xff2D343C),
        ),
        dialogBackgroundColor: const Color(0xff2D343C),
        accentColor: const Color(0xff2D343C),
        backgroundColor: const Color(0xff262B31),
        buttonColor: const Color(0xffFF7751),
        cardColor: const Color(0xff2D343C),
        textTheme: const TextTheme(
          headline4: TextStyle(fontSize: 15, color: Colors.white),
          headline3: TextStyle(fontSize: 20, color: Colors.white),
          headline2: TextStyle(fontSize: 25, color: Colors.white),
        ),
        splashColor: const Color(0xFF755F5F),
        primaryColor: Color(0xff262B31),
        accentTextTheme: const TextTheme(
          button: TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
        ),
      ),
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
        backgroundColor: Colors.white,
        accentColor: const Color(0xff173a05),
        buttonColor: const Color(0xff173a05),
        textTheme: const TextTheme(
          headline4: TextStyle(fontSize: 20, color: Color(0xff173a05)),
        ),
        splashColor: const Color(0xff32770f),
        accentTextTheme: const TextTheme(
          button: TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
        ),
      ),
      // home: MyChatSharedPrefrence.get("islogedin") ? LoginScreen() : LoginScreen(),
      home: LoginScreen(),
    );
  }
}
