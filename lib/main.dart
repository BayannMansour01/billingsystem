import 'package:billingsystem/layout/app_layout.dart';
import 'package:billingsystem/modules/adminInfo/add_profile_info.dart';
import 'package:billingsystem/modules/bill_detailes/bill.dart';
import 'package:billingsystem/modules/customerinfo/add_profile_info.dart';
import 'package:billingsystem/modules/first_login/firstlogin.dart';
import 'package:billingsystem/modules/first_register/registerrole.dart';
import 'package:billingsystem/modules/invoices_screen/invoice.dart';
import 'package:billingsystem/modules/invoices_screen/invoiceAdmin.dart';
import 'package:billingsystem/modules/requestScreenAdmin/requestScreenAdmin.dart';
import 'package:billingsystem/modules/requests_Screen_customer/requests_Screen_customer.dart';
import 'package:billingsystem/modules/splash/splashscreen.dart';
import 'package:billingsystem/shared/Bloc_observer.dart';
import 'package:billingsystem/shared/componentes/componentes.dart';
import 'package:billingsystem/shared/cubit/app_cubit.dart';
import 'package:billingsystem/shared/network/local/cache_helper.dart';
import 'package:billingsystem/shared/network/remote/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  AppCubit();
  diohelper.init();
  runApp(MyApp());
  // BlocOverrides.runZoned(() {

  // }, blocObserver: MyBlocObserver());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
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
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                  type: BottomNavigationBarType.fixed),
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
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
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
            home: registerrole(),
          );
        },
      ),
    );
  }
}
