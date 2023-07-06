import 'package:billingsystem/shared/componentes/constance.dart';
import 'package:billingsystem/shared/cubit/app_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class appLayout extends StatelessWidget {
  var role;
  appLayout([roleid]) {
    role = roleid;
  }
  List<BottomNavigationBarItem> bottomitem = [
    BottomNavigationBarItem(
      icon: Icon(Icons.request_page_outlined),
      label: 'Requests',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.inventory),
      label: 'Invoices',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.person),
      label: 'Profile',
    ),
  ];

  var user_name;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit()
        ..getinvoicesAdmn()
        ..getinvoicesCustomer()
        ..getuserdata(accesstoken)
        ..getadmindata(accesstoken),
      child: BlocConsumer<AppCubit, AppState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            bottomNavigationBar: BottomNavigationBar(
                currentIndex: AppCubit.get(context).CurrentIndex,
                items: AppCubit.get(context).bottomitem,
                onTap: (index) {
                  AppCubit.get(context).changeBottomIndex(index);
                }),
            body: role == 0
                ? AppCubit.get(context)
                    .ScreensAdmin[AppCubit.get(context).CurrentIndex]
                : AppCubit.get(context)
                    .ScreensCustomer[AppCubit.get(context).CurrentIndex],
          );
        },
      ),
    );
  }
}
