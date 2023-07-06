import 'package:billingsystem/models/user_profile.dart';
import 'package:billingsystem/modules/profileuser/profile_user.dart';
import 'package:billingsystem/shared/componentes/componentes.dart';
import 'package:billingsystem/shared/componentes/constance.dart';
import 'package:billingsystem/shared/cubit/app_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class editprofile_user extends StatelessWidget {
  var username = TextEditingController();

  var phone = TextEditingController();
  var last_name = TextEditingController();
  var first_name = TextEditingController();

  final formkey = GlobalKey<FormState>();

  bool ispass = true;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return BlocProvider(
        create: (context) => AppCubit(),
        child: BlocConsumer<AppCubit, AppState>(listener: (context, state) {
          if (state is EditusereSucesses) {
            Fluttertoast.showToast(
                msg: (AppCubit.get(context).editprofileuser.message).toString(),
                toastLength: Toast.LENGTH_LONG,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 5,
                backgroundColor: Colors.green,
                textColor: Colors.white,
                fontSize: 16.0);
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => Profile_user()));
          }
        }, builder: (context, state) {
          return Stack(children: [
            Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                colors: [
                  Color.fromRGBO(4, 20, 9, 1),
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
                  child: Center(
                    child: Form(
                      key: formkey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              MaterialButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Icon(
                                  Icons.arrow_left_sharp,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Text(
                                'EDIT PROFILE',
                                style: TextStyle(color: Colors.white),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          SingleChildScrollView(
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: Colors.white),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 30),
                                child: Column(
                                  children: [
                                    Center(
                                      child: defaultextformfield(
                                          controlle: username,
                                          validate: (value) {},
                                          type: TextInputType.text,
                                          onChange: (value) {
                                            print(value);
                                          },
                                          onSubmit: (value) {
                                            print(value);
                                          },
                                          label: 'User Name',
                                          prefixIcon: Icons.person,
                                          ispassword: false),
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    defaultextformfield(
                                      controlle: first_name,
                                      validate: (value) {},
                                      type: TextInputType.text,
                                      onChange: (value) {
                                        print(value);
                                      },
                                      onSubmit: (value) {
                                        print(value);
                                      },
                                      label: 'First Name',
                                      prefixIcon: Icons.person,
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    defaultextformfield(
                                        controlle: last_name,
                                        validate: (value) {},
                                        type: TextInputType.text,
                                        onChange: (value) {
                                          print(value);
                                        },
                                        onSubmit: (value) {
                                          print(value);
                                        },
                                        label: 'Last Name',
                                        prefixIcon: Icons.person,
                                        ispassword: false),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    defaultextformfield(
                                      controlle: phone,
                                      validate: (value) {},
                                      onChange: (value) {
                                        print(value);
                                      },
                                      onSubmit: (value) {
                                        print(value);
                                      },
                                      ispassword: false,
                                      type: TextInputType.text,
                                      obscureText: ispass,
                                      label: 'phone',
                                      prefixIcon: Icons.phone_outlined,
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    defaultButton(
                                      width: 150,
                                      height: 50,
                                      function: () {
                                        if (formkey.currentState!.validate()) {
                                          AppCubit.get(context)
                                              .user_editprofile(
                                                  user_name: username.text,
                                                  first_name: first_name.text,
                                                  last_name: last_name.text,
                                                  phone: phone.text,
                                                  token: accesstoken);
                                        }
                                      },
                                      text: 'UPDATE',
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ]);
        }));
  }
}
