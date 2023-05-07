import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:my_chat/shared/local/shared_prefrence.dart';
import 'package:my_chat/shared/network/dio_helper.dart';

import 'generated/l10n.dart';
import 'modules/home_page/presentation/screens/home_page_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MyChatSharedPrefrence.init();
  DioHelper.init();
  final bool? isLoginSuccess = MyChatSharedPrefrence.get("isLogedIn");
  runApp(DevicePreview(
    enabled: true,
    builder: (context) =>
        MyApp(
          isLoginSuccess: isLoginSuccess ?? false,
        ),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.isLoginSuccess});

  static Locale locale = S.delegate.supportedLocales[0];
  final bool isLoginSuccess;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      localizationsDelegates: const [
        AppLocalizationDelegate(),
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      // locale: locale,
      supportedLocales: S.delegate.supportedLocales,
      darkTheme: ThemeData(
        errorColor: const Color(0xffFF7751),
        colorScheme: const ColorScheme(
          primary: Color(0xff2D343C),
          background: Color(0xff262B31),
          brightness: Brightness.dark,
          onPrimary: Color(0xff2D343C),
          secondary: Colors.white,
          onSecondary: Colors.white,
          error: Color(0xffFF7751),
          onError: Color(0xffFF7751),
          onBackground: Color(0xff262B31),
          surface: Colors.white,
          onSurface: Colors.white,
        ),
        appBarTheme: const AppBarTheme(
          elevation: 0,
          backgroundColor: Colors.transparent,
          titleTextStyle: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          actionsIconTheme: IconThemeData(color: Colors.white, size: 25),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
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
          titleSmall: TextStyle(
            fontSize: 15,
            color: Colors.white,
          ),
          titleLarge: TextStyle(
            fontSize: 25,
            color: Colors.white,
          ),
          bodyLarge: TextStyle(
            fontSize: 25,
            color: Colors.white,
          ),
          bodyMedium: TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
          bodySmall: TextStyle(
            fontSize: 15,
            color: Colors.white,
          ),
          headlineSmall: TextStyle(
            fontSize: 15,
            color: Colors.white,
          ),
          labelSmall:  TextStyle(
            fontSize: 15,
            color: Colors.white,
          ),
          labelLarge:  TextStyle(
            fontSize: 25,
            color: Colors.white,
          ),
          labelMedium:  TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
          headlineLarge:  TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
          headlineMedium:  TextStyle(
            fontSize: 25,
            color: Colors.white,
          ),
          titleMedium: TextStyle(
            fontSize: 25,
            color: Colors.white,
          ),
          displayMedium: TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
          displayLarge: TextStyle(
            fontSize: 25,
            color: Colors.white,
          ),
          displaySmall: TextStyle(
            fontSize: 15,
            color: Colors.white,
          ),
        ),
        splashColor: const Color(0xFF755F5F),
        primaryColor: const Color(0xff262B31),
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
        colorScheme: const ColorScheme(
          primary: Color(0xFFF5F5F5),
          background: Colors.white,
          brightness: Brightness.light,
          onPrimary: Color(0xFFF5F5F5),
          secondary: Color(0xff262B31),
          onSecondary: Color(0xff262B31),
          error: Color(0xffFF7751),
          onError: Color(0xffFF7751),
          onBackground: Colors.white,
          surface: Color(0xff262B31),
          onSurface: Color(0xff262B31),
        ),
        appBarTheme: const AppBarTheme(
          elevation: 0,
          backgroundColor: Colors.transparent,
          titleTextStyle: TextStyle(
              color: Color(0xff262B31),
              fontSize: 20,
              fontWeight: FontWeight.bold),
          actionsIconTheme: IconThemeData(color: Color(0xff262B31), size: 25),
        ),
        iconTheme: const IconThemeData(
          color: Color(0xff262B31),
        ),
        primaryIconTheme: const IconThemeData(color: Color(0xFF2D343C)),
        bottomSheetTheme: const BottomSheetThemeData(
          backgroundColor: Color(0xFFF5F5F5),
          modalBackgroundColor: Color(0xFFF5F5F5),
        ),
        dialogBackgroundColor: const Color(0xFFF5F5F5),
        accentColor: const Color(0xFFF5F5F5),
        backgroundColor: const Color(0xFFFAFAFA),
        buttonColor: const Color(0xffFF7751),
        cardColor: const Color(0xFFF5F5F5),
        textTheme: const TextTheme(
          titleSmall: TextStyle(
            fontSize: 15,
            color: Color(0xff262B31),
          ),
          titleLarge: TextStyle(
            fontSize: 25,
            color: Color(0xff262B31),
          ),
          bodyLarge: TextStyle(
            fontSize: 25,
            color: Color(0xff262B31),
          ),
          bodyMedium: TextStyle(
            fontSize: 20,
            color: Color(0xff262B31),
          ),
          bodySmall: TextStyle(
            fontSize: 15,
            color: Color(0xff262B31),
          ),
          headlineSmall: TextStyle(
            fontSize: 15,
            color: Color(0xff262B31),
          ),
          labelSmall:  TextStyle(
            fontSize: 15,
            color: Color(0xff262B31),
          ),
          labelLarge:  TextStyle(
            fontSize: 25,
            color: Color(0xff262B31),
          ),
          labelMedium:  TextStyle(
            fontSize: 20,
            color: Color(0xff262B31),
          ),
          headlineLarge:  TextStyle(
            fontSize: 20,
            color: Color(0xff262B31),
          ),
          headlineMedium:  TextStyle(
            fontSize: 25,
            color: Color(0xff262B31),
          ),
          titleMedium: TextStyle(
            fontSize: 25,
            color: Color(0xff262B31),
          ),
          displayMedium: TextStyle(
            fontSize: 20,
            color: Color(0xff262B31),
          ),
          displayLarge: TextStyle(
            fontSize: 25,
            color: Color(0xff262B31),
          ),
          displaySmall: TextStyle(
            fontSize: 15,
            color: Color(0xff262B31),
          ),
        ),
        splashColor: const Color(0xFF755F5F),
        primaryColor: const Color(0xFFFAFAFA),
        primaryColorLight: const Color(0xff262B31),
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
