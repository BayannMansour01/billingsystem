import 'package:billingsystem/modules/login_Screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: TextTheme(
            bodyText1: TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.w800,
          color: Colors.black,
        )),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
            // backgroundColor: Colors.orange,
            ),
        primarySwatch: Colors.green,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
            iconTheme: IconThemeData(color: Colors.black),
            titleTextStyle:
                TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            elevation: 0.0,
            backgroundColor: Colors.white,
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: Colors.white,
              statusBarIconBrightness: Brightness.dark,
            )),
        bottomNavigationBarTheme:
            BottomNavigationBarThemeData(type: BottomNavigationBarType.fixed),
      ),
      darkTheme: ThemeData(
        textTheme: TextTheme(
            bodyText1: TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.w800,
          color: Colors.white,
        )),
        scaffoldBackgroundColor: HexColor('333739'),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Colors.orange,
        ),
        primarySwatch: Colors.blue,
        appBarTheme: AppBarTheme(
            iconTheme: IconThemeData(color: Colors.white),
            titleTextStyle: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
            elevation: 0.0,
            backgroundColor: HexColor('333739'),
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: HexColor('333739'),
              statusBarIconBrightness: Brightness.dark,
            )),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
            type: BottomNavigationBarType.fixed,
            backgroundColor: HexColor('333739'),
            selectedItemColor: Colors.blue,
            unselectedItemColor: Colors.grey),
      ),
      themeMode: ThemeMode.light,
      home: loginScreen(),
    );
  }
}
