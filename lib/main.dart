import 'package:flutter/material.dart';
import 'package:my_chat/modules/auth/presentation/screens/login_screen.dart';
import 'package:my_chat/shared/local/shared_prefrence.dart';
import 'package:my_chat/shared/network/dio_helper.dart';

import 'modules/home_page/presentation/screens/home_page_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MyChatSharedPrefrence.init();
  DioHelper.init();
  final bool? isLoginSuccess = MyChatSharedPrefrence.get("isLogedIn");
  runApp(MyApp(
    isLoginSuccess: isLoginSuccess ?? false,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.isLoginSuccess});

  final bool isLoginSuccess;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      // useInheritedMediaQuery: true,
      // locale: DevicePreview.locale(context),
      // builder: DevicePreview.appBuilder,
      darkTheme: ThemeData(
        errorColor: const Color(0xffFF7751),
        appBarTheme: const AppBarTheme(
          elevation: 0,
          backgroundColor: Colors.transparent,
          titleTextStyle: TextStyle(
            color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold
          ),
          actionsIconTheme: IconThemeData(color: Colors.white, size: 25),
        ),
        iconTheme: IconThemeData(color: Colors.white),
        bottomSheetTheme: const BottomSheetThemeData(
          backgroundColor: Color(0xff2D343C),
          modalBackgroundColor: Color(0xff2D343C),
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
          headline5: TextStyle(fontSize: 17, color: Color(0xffFF7751)),
        ),
        splashColor: const Color(0xFF755F5F),
        primaryColor: Color(0xff262B31),
        primaryColorLight: Colors.white,
        accentTextTheme: const TextTheme(
          button: TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
        ),
      ),
      theme: ThemeData(
        errorColor: const Color(0xffFF7751),
        appBarTheme: const AppBarTheme(
          elevation: 0,
          backgroundColor: Colors.transparent,
          titleTextStyle: TextStyle(
            color: Color(0xff262B31),
            fontSize: 20,
            fontWeight: FontWeight.bold
          ),
          actionsIconTheme: IconThemeData(color: Color(0xff262B31), size: 25),
        ),
        iconTheme: const IconThemeData(
          color: Color(0xff262B31),
        ),
        primaryIconTheme: IconThemeData(color: Color(0xFF2D343C)),
        bottomSheetTheme: const BottomSheetThemeData(
          backgroundColor: Color(0xFFF5F5F5),
          modalBackgroundColor: Color(0xFFF5F5F5),
        ),
        dialogBackgroundColor: const Color(0xF5F5F5),
        accentColor: const Color(0xFFF5F5F5),
        backgroundColor: const Color(0xFFFAFAFA),
        buttonColor: const Color(0xffFF7751),
        cardColor: const Color(0xF5F5F5),
        textTheme: const TextTheme(
          headline4: TextStyle(fontSize: 15, color: Color(0xff262B31)),
          headline3: TextStyle(fontSize: 20, color: Color(0xff262B31)),
          headline2: TextStyle(fontSize: 25, color: Color(0xff262B31)),
          headline5: TextStyle(fontSize: 15, color: Color(0xffFF7751)),
        ),
        splashColor: const Color(0xFF755F5F),
        primaryColor: const Color(0xFFFAFAFA),
        primaryColorLight: Color(0xff262B31),
        accentTextTheme: const TextTheme(
          button: TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
        ),
      ),
      home: HomePageScreen(),
      // home: isLoginSuccess ? HomePageScreen() : LoginScreen(),
    );
  }
}
