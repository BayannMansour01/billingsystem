import 'package:billingsystem/layout/app_layout.dart';
import 'package:billingsystem/modules/customerinfo/add_profile_info.dart';
import 'package:billingsystem/shared/componentes/constance.dart';
import 'package:billingsystem/shared/cubit/app_cubit.dart';
import 'package:billingsystem/shared/componentes/componentes.dart';
import 'package:billingsystem/shared/network/local/cache_helper.dart';
import 'package:conditional_builder_rec/conditional_builder_rec.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../adminInfo/add_profile_info.dart';

class loginFirst extends StatelessWidget {
  var emailController = TextEditingController();
  var PassController = TextEditingController();

  final formkey = GlobalKey<FormState>();
  final int? role;
  loginFirst([this.role]);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppState>(
        listener: (context, state) {
          if (state is loginSucessesState) {}
          if ((state is profileSucesses_admin || state is userprofileError) &&
              AppCubit.get(context).profile_admModel.data!.businessName !=
                  "business_name") {
            print('passedadmin');
            Navigator.push(context,
                MaterialPageRoute(builder: ((context) => appLayout(0))));
          } else if ((state is userprofilSucesses ||
                  state is profileError_admin) &&
              AppCubit.get(context).profile_userModel.data!.userName !=
                  "User_name") {
            Navigator.push(context,
                MaterialPageRoute(builder: ((context) => appLayout(1))));
          } else {
            if (role == 0) {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => adminAddProfileScreen(role)),
              );
            } else if (role == 1) {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => customeraddProfileScreen(role)),
              );
            }
          }
          if (state is loginSucessesState) {
            print('login');
            print(role);
            // AppCubit.get(context).login(
            //     email: emailController.text, password: PassController.text);
            // print(emailController.text);
            // print(PassController.text);

            if (state.model.access_token != null) {
              // print('rrrr+${AppCubit.get(context).rolid}');
              Fluttertoast.showToast(
                  msg: 'login Success',
                  toastLength: Toast.LENGTH_LONG,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 5,
                  backgroundColor: Colors.green,
                  textColor: Colors.white,
                  fontSize: 16.0);
            } else {
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
                          'LOGIN',
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
                        ConditionalBuilderRec(
                          condition: state is! loginLoadingState,
                          builder: (context) => defaultButton(
                            width: double.infinity,
                            height: 50,
                            function: () {
                              if (formkey.currentState!.validate()) {
                                AppCubit.get(context).login(
                                    email: emailController.text,
                                    password: PassController.text);
                                print(emailController.text);
                                print(PassController.text);
                              }
                            },
                            text: 'SIGN IN',
                          ),
                          fallback: (context) =>
                              Center(child: CircularProgressIndicator()),
                        ),
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
