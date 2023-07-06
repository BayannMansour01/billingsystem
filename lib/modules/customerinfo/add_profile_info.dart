import 'package:billingsystem/layout/app_layout.dart';
import 'package:billingsystem/shared/componentes/componentes.dart';
import 'package:billingsystem/shared/componentes/constance.dart';
import 'package:billingsystem/shared/cubit/app_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class customeraddProfileScreen extends StatelessWidget {
  var formkey = GlobalKey<FormState>();
  var role;
  customeraddProfileScreen(roleid) {
    role = roleid;
  }

  @override
  Widget build(BuildContext context) {
    var firstnamecontroller = TextEditingController();
    var lastnamecontroller = TextEditingController();
    var phonecontroller = TextEditingController();
    var usernamecontroller = TextEditingController();
    late String token;
    return BlocProvider(
        create: (BuildContext context) => AppCubit(),
        child: BlocConsumer<AppCubit, AppState>(
          listener: (context, state) {
            if (state is addCustomerInfoSucessesState) {
              Fluttertoast.showToast(
                  msg: 'Customer profile created successfully',
                  toastLength: Toast.LENGTH_LONG,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 5,
                  backgroundColor: Colors.green,
                  textColor: Colors.white,
                  fontSize: 16.0);
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => appLayout(role)));
            }
          },
          builder: (context, state) {
            return Scaffold(
              appBar: AppBar(),
              body: Center(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Form(
                      key: formkey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image(
                              image: AssetImage('assets/images/login.png'),
                              width: 600.0,
                              height: 240.0),
                          Text('Add Your Information',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline2!
                                  .copyWith(
                                    fontWeight: FontWeight.bold,
                                  )),
                          SizedBox(
                            height: 20,
                          ),
                          defaultextformfield(
                              controlle: firstnamecontroller,
                              type: TextInputType.text,
                              label: 'first name',
                              prefixIcon: Icons.person,
                              validate: (value) {
                                if (value == null || value.isEmpty)
                                  return 'first name can\'t be empty';
                                if (value.length < 2)
                                  return 'the name too short ';
                              },
                              onSubmit: (value) {
                                // return value;
                              }),
                          SizedBox(
                            height: 15,
                          ),
                          defaultextformfield(
                              controlle: lastnamecontroller,
                              type: TextInputType.text,
                              label: 'last name',
                              prefixIcon: Icons.person,
                              validate: (value) {
                                if (value == null || value.isEmpty)
                                  return 'last name can\'t be empty';
                                if (value.length < 2)
                                  return 'the name too short ';
                              },
                              onSubmit: (value) {
                                // return value;
                              }),
                          SizedBox(
                            height: 15,
                          ),
                          defaultextformfield(
                              controlle: usernamecontroller,
                              type: TextInputType.text,
                              label: 'user name',
                              prefixIcon: Icons.person,
                              validate: (value) {
                                if (value == null || value.isEmpty)
                                  return 'last name can\'t be empty';
                                if (value.length < 2)
                                  return 'the name too short ';
                              },
                              onSubmit: (value) {
                                return value;
                              }),
                          SizedBox(
                            height: 15,
                          ),
                          defaultextformfield(
                              controlle: phonecontroller,
                              type: TextInputType.phone,
                              label: 'phone number',
                              prefixIcon: Icons.phone,
                              validate: (value) {
                                if (value == null || value.isEmpty)
                                  return 'field can\'t be empty';
                              },
                              onSubmit: (value) {
                                return value;
                              }),
                          SizedBox(
                            height: 15,
                          ),
                          defaultButton(
                            width: double.infinity,
                            height: 50,
                            function: () {
                              if (formkey.currentState!.validate()) {
                                AppCubit.get(context).CreateProfileCustomer(
                                    firstname: firstnamecontroller.text,
                                    lastname: lastnamecontroller.text,
                                    username: usernamecontroller.text,
                                    phone: phonecontroller.text,
                                    token: accesstoken);
                              }
                            },
                            text: 'Done',
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ));
  }
}
