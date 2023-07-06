import 'package:billingsystem/layout/app_layout.dart';
import 'package:billingsystem/modules/adminInfo/add_profile_info.dart';
import 'package:billingsystem/modules/customerinfo/add_profile_info.dart';
import 'package:billingsystem/modules/first_login/firstlogin.dart';
import 'package:billingsystem/modules/invoices_screen/invoice.dart';
import 'package:billingsystem/modules/invoices_screen/invoiceAdmin.dart';
import 'package:billingsystem/shared/componentes/constance.dart';
import 'package:billingsystem/shared/cubit/app_cubit.dart';
import 'package:billingsystem/shared/componentes/componentes.dart';
import 'package:billingsystem/shared/network/local/cache_helper.dart';
import 'package:conditional_builder_rec/conditional_builder_rec.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class registerrole extends StatelessWidget {
  List<String> items = ['Tradesman', 'Customer'];
  var emailController = TextEditingController();
  var PassController = TextEditingController();
  var ConfirnController = TextEditingController();
  var namecontroller = TextEditingController();
  var roleController;
  final formkey = GlobalKey<FormState>();
  //String? roleid;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppState>(
        listener: (context, state) {
          if (state is RegisterSucessesState) {
            print(AppCubit.rolid);
            // print(state.model.message.);
            if (state.model.access_token != null) {
              accesstoken = state.model.access_token;
              Fluttertoast.showToast(
                  msg: 'Register Success',
                  toastLength: Toast.LENGTH_LONG,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 5,
                  backgroundColor: Colors.green,
                  textColor: Colors.white,
                  fontSize: 16.0);
              print('role ${AppCubit.rolid}');

              if (AppCubit.rolid == 0) {
                Navigator.push(context, MaterialPageRoute(builder: ((context) {
                  print(AppCubit.rolid);
                  // return loginFirst(AppCubit.rolid);
                  return adminAddProfileScreen(AppCubit.rolid);
                })));
              } else {
                Navigator.push(context, MaterialPageRoute(builder: ((context) {
                  print(AppCubit.rolid);
                  // return loginFirst(AppCubit.rolid);
                  return customeraddProfileScreen(AppCubit.rolid);
                })));
              }

              //  print('Refiste+${AppCubit.get(context).rolid}');
              //     if (roleid == 0) {
              //   Navigator.push(
              //       context,
              //       MaterialPageRoute(
              //         builder: (context) => adminAddProfileScreen(roleid),
              //       ));
              // } else {
              //   Navigator.push(
              //       context,
              //       MaterialPageRoute(
              //           builder: (context) =>
              //               customeraddProfileScreen(roleid)));
              // }
              //print(state.model.access_token);
              // CacheHelper.savedata(
              //         key: 'access_token', value: state.model.access_token)
              //     .then((value) {
              //   accesstoken = state.model.access_token!;

              //   if (state.model.message!.roleId == 1) {
              //     Navigator.pushAndRemoveUntil(
              //         context,
              //         MaterialPageRoute(
              //             builder: (context) => adminAddProfileScreen()),
              //         (route) => false);
              //   } else {
              //     Navigator.pushAndRemoveUntil(
              //         context,
              //         MaterialPageRoute(
              //             builder: (context) => customeraddProfileScreen()),
              //         (route) => false);
              //   }
              // });
            } else {
              // print(state.model.message!.email);
              //print(state.model.message!.roleId);
              //print(state.model.message!.password);
              Fluttertoast.showToast(
                  msg: 'Error, Try again',
                  toastLength: Toast.LENGTH_LONG,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 5,
                  backgroundColor: Colors.red,
                  textColor: Colors.white,
                  fontSize: 16.0);
            }
          }
        },
        builder: (context, state) {
          // print(AppCubit.get(context).rolid);
          return Scaffold(
              body: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Center(
              child: SingleChildScrollView(
                child: Form(
                  key: formkey,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Image(
                              image: AssetImage('assets/images/login.png'),
                              height: 240,
                              width: 600),
                        ),
                        Text(
                          'REGISTER',
                          style: Theme.of(context)
                              .textTheme
                              .headline2!
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        defaultextformfield(
                            controlle: emailController,
                            validate: (value) {
                              if (value!.isEmpty) {
                                return 'Email mustn\'t be empty';
                              } else if (!value.contains('@')) {
                                return 'You forget \'@\'';
                              }
                              return null;
                            },
                            type: TextInputType.emailAddress,
                            onChange: (value) {
                              print(value);
                            },
                            onSubmit: (value) {
                              print(value);
                            },
                            label: 'Email',
                            prefixIcon: Icons.email_outlined,
                            ispassword: false),
                        SizedBox(
                          height: 15,
                        ),
                        defaultextformfield(
                          controlle: PassController,
                          validate: (value) {
                            if (value!.isEmpty) {
                              return 'Password is too short';
                            }
                            return null;
                          },
                          onChange: (value) {
                            print(value);
                          },
                          onSubmit: (value) {
                            print(value);
                          },
                          ispassword: AppCubit.get(context).isPassShown,
                          type: TextInputType.visiblePassword,
                          label: 'Password',
                          prefixIcon: Icons.lock_outlined,
                          suffixIcon: AppCubit.get(context).suffixPass,
                          suffixPressed: () {
                            AppCubit.get(context).changePassvisiblity();
                          },
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        defaultextformfield(
                          controlle: ConfirnController,
                          validate: (value) {
                            if (value!.isEmpty) {
                              return 'Password is too short';
                            }
                            return null;
                          },
                          onChange: (value) {
                            print(value);
                          },
                          onSubmit: (value) {
                            print(value);
                          },
                          ispassword: AppCubit.get(context).isPassShown,
                          type: TextInputType.visiblePassword,
                          label: 'Confirm Password',
                          prefixIcon: Icons.lock_outlined,
                          suffixIcon: AppCubit.get(context).suffixPass,
                          suffixPressed: () {
                            AppCubit.get(context).changePassvisiblity();
                          },
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          width: double.infinity,
                          child: DropdownButton<String>(
                              iconEnabledColor: Colors.green,
                              value:
                                  AppCubit.get(context).items[AppCubit.rolid],
                              items: AppCubit.get(context)
                                  .items
                                  .map((item) => DropdownMenuItem<String>(
                                      value: item, child: Text(item)))
                                  .toList(),
                              onChanged: (item) {
                                AppCubit.get(context).changRoleindex(item!);
                                roleController = AppCubit.rolid + 1;
                              }),
                        ),
                        ConditionalBuilderRec(
                          condition: state is! RegisterLoadingState,
                          builder: (context) => defaultButton(
                            width: double.infinity,
                            height: 50,
                            function: () {
                              if (formkey.currentState!.validate()) {
                                AppCubit.get(context).Register(
                                    email: emailController.text,
                                    password: PassController.text,
                                    password_confirmation:
                                        ConfirnController.text,
                                    roleId: roleController.toString());
                              }
                            },
                            text: 'SIGN UP',
                          ),
                          fallback: (context) =>
                              Center(child: CircularProgressIndicator()),
                        ),
                        Row(
                          children: [
                            Text('already have account ? '),
                            TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => loginFirst()));
                                },
                                child: Text('Sign in now'))
                          ],
                        )
                      ]),
                ),
              ),
            ),
          ));
        },
      ),
    );
  }
}
