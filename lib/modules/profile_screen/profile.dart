import 'dart:io';
import 'package:billingsystem/modules/editProfile/Admineditprofile.dart';
import 'package:billingsystem/modules/first_login/firstlogin.dart';
import 'package:billingsystem/modules/first_register/registerrole.dart';
import 'package:billingsystem/shared/componentes/constance.dart';
import 'package:billingsystem/shared/cubit/app_cubit.dart';
import 'package:conditional_builder_rec/conditional_builder_rec.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:printing/printing.dart';

class Profile extends StatelessWidget {
  var bname;
  var image;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return BlocProvider(
        create: (context) => AppCubit()..getadmindata(accesstoken),
        child: BlocConsumer<AppCubit, AppState>(listener: (context, state) {
          if (state is profileSucesses_admin) {
            bname = state.profile_admModel!.data!.businessName!;
            image = state.profile_admModel!.data!.image;
            print(image);
          }
          if (state is logoutSucesses_admin) {
            Fluttertoast.showToast(
                msg: state.logout_admModel!.message.toString(),
                toastLength: Toast.LENGTH_LONG,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 5,
                backgroundColor: Colors.green,
                textColor: Colors.white,
                fontSize: 16.0);
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => registerrole()),
              (Route<dynamic> route) => false,
            );
          }
        }, builder: (context, state) {
          return ConditionalBuilderRec(
              fallback: (context) => Center(child: CircularProgressIndicator()),
              condition: state is! profileLoading_admin,
              builder: (context) {
                return Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                        colors: [
                          Color.fromRGBO(4, 15, 9, 1),
                          Color.fromRGBO(20, 200, 90, 1),
                        ],
                        begin: FractionalOffset.bottomLeft,
                        end: FractionalOffset.bottomRight,
                      )),
                    ),
                    Scaffold(
                      backgroundColor: Colors.transparent,
                      body: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 35),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              Column(children: [
                                Center(
                                  child: CircleAvatar(
                                    child: Icon(Icons.camera_alt),
                                    radius: 50,
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  '${bname.toString()}',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 26,
                                    fontStyle: FontStyle.italic,
                                  ),
                                ),
                              ]),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      color: Colors.grey[300]),
                                  height: height,
                                  width: double.infinity,
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: 45,
                                      ),
                                      Container(
                                        height: height * 0.1,
                                        width: width * 0.8,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(40),
                                          gradient: LinearGradient(
                                            colors: [
                                              Color.fromRGBO(4, 15, 9, 1),
                                              Color.fromRGBO(20, 150, 70, 1),
                                            ],
                                            begin: FractionalOffset.bottomLeft,
                                            end: FractionalOffset.bottomRight,
                                          ),
                                        ),
                                        child: Row(
                                          children: [
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Icon(
                                              Icons.edit,
                                              color: Colors.white70,
                                              size: height * 0.035,
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                              'EDIT YOUR PROFILE',
                                              style: TextStyle(
                                                  color: Colors.white70),
                                            ),
                                            SizedBox(
                                              width: 15,
                                            ),
                                            MaterialButton(
                                              onPressed: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            editprofile()));
                                              },
                                              child: Icon(
                                                Icons.arrow_right_sharp,
                                                color: Colors.grey[300],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 45,
                                      ),
                                      Container(
                                        height: height * 0.1,
                                        width: width * 0.8,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(40),
                                          gradient: LinearGradient(
                                            colors: [
                                              Color.fromRGBO(4, 15, 9, 1),
                                              Color.fromRGBO(20, 150, 70, 1),
                                            ],
                                            begin: FractionalOffset.bottomLeft,
                                            end: FractionalOffset.bottomRight,
                                          ),
                                        ),
                                        child: Row(
                                          children: [
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Icon(
                                              Icons.logout_rounded,
                                              color: Colors.white70,
                                              size: height * 0.035,
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                              'LOGOUT',
                                              style: TextStyle(
                                                  color: Colors.white70),
                                            ),
                                            SizedBox(
                                              width: 80,
                                            ),
                                            MaterialButton(
                                              onPressed: () {
                                                AppCubit.get(context).logout();
                                              },
                                              child: Icon(
                                                Icons.arrow_right_sharp,
                                                color: Colors.grey[300],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 45,
                                      ),
                                      Container(
                                        height: height * 0.1,
                                        width: width * 0.8,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(40),
                                          gradient: LinearGradient(
                                            colors: [
                                              Color.fromRGBO(4, 15, 9, 1),
                                              Color.fromRGBO(20, 150, 70, 1),
                                            ],
                                            begin: FractionalOffset.bottomLeft,
                                            end: FractionalOffset.bottomRight,
                                          ),
                                        ),
                                        child: Row(
                                          children: [
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Icon(
                                              Icons.delete,
                                              color: Colors.white70,
                                              size: height * 0.035,
                                            ),
                                            SizedBox(
                                              width: 9,
                                            ),
                                            Text(
                                              'DELETE YOUR ACCOUNT',
                                              style: TextStyle(
                                                  color: Colors.white70),
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            MaterialButton(
                                              onPressed: () {
                                                AppCubit.get(context)
                                                    .delete_admModel;
                                                if (state
                                                    is deleteprofileSucesses_admin) {
                                                  Navigator.pushAndRemoveUntil(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            loginFirst(0)),
                                                    (Route<dynamic> route) =>
                                                        false,
                                                  );
                                                }
                                              },
                                              child: Icon(
                                                Icons.arrow_right_sharp,
                                                color: Colors.grey[300],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ))
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                );
              });
        }));
  }
}
