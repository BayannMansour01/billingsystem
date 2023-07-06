import 'dart:convert';
import 'dart:io';
import 'package:billingsystem/layout/app_layout.dart';
import 'package:billingsystem/shared/componentes/componentes.dart';
import 'package:billingsystem/shared/componentes/constance.dart';
import 'package:billingsystem/shared/cubit/app_cubit.dart';
import 'package:conditional_builder_rec/conditional_builder_rec.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class adminAddProfileScreen extends StatelessWidget {
  var rolee;
  adminAddProfileScreen([role]) {
    rolee = role;
  }
  @override
  Widget build(BuildContext context) {
    var businessname = TextEditingController();
    var phoneController = TextEditingController();
    var regionController = TextEditingController();
    var logoController;
    var cityController;
    final formkey = GlobalKey<FormState>();

    return BlocProvider(
      create: (context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppState>(
        listener: (context, state) {
          if (state is addadminInfoSucessesState) {
            Fluttertoast.showToast(
                msg: 'Admin profile created successfully',
                toastLength: Toast.LENGTH_LONG,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 5,
                backgroundColor: Colors.green,
                textColor: Colors.white,
                fontSize: 16.0);
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => appLayout(rolee)));
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(20.0),
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
                          'Add Your Information',
                          style: Theme.of(context)
                              .textTheme
                              .headline2!
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Center(
                          child: MaterialButton(
                              child: CircleAvatar(
                                  radius: 60,
                                  child:
                                      AppCubit.get(context).pickedfile == null
                                          ? Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Icon(
                                                  Icons.camera_alt,
                                                  size: 50,
                                                ),
                                              ],
                                            )
                                          : null,
                                  backgroundImage:
                                      AppCubit.get(context).pickedfile != null
                                          ? Image(
                                                  image: FileImage(
                                                      AppCubit.get(context)
                                                          .pickedfile!))
                                              .image
                                          : null),
                              onPressed: () {
                                AppCubit.get(context).changeLogo();
                              }),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        defaultextformfield(
                            controlle: businessname,
                            validate: (value) {
                              if (value!.isEmpty) {
                                return 'Business Name mustn\'t be empty';
                              }
                              return null;
                            },
                            type: TextInputType.text,
                            onChange: (value) {
                              print(value);
                            },
                            onSubmit: (value) {
                              print(value);
                            },
                            label: 'Business Name',
                            prefixIcon: Icons.business_outlined,
                            ispassword: false),
                        SizedBox(
                          height: 15,
                        ),
                        defaultextformfield(
                            controlle: phoneController,
                            type: TextInputType.number,
                            validate: (value) {
                              if (value!.isEmpty) {
                                return 'Phone mustn\'t be empty';
                              }
                              return null;
                            },
                            onChange: (value) {
                              print(value);
                            },
                            onSubmit: (value) {
                              print(value);
                            },
                            label: 'Phone Number',
                            prefixIcon: Icons.phone_outlined,
                            ispassword: false),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                width: double.infinity,
                                child: DropdownButton<String>(
                                    iconEnabledColor: Colors.green,
                                    value: AppCubit.get(context).stateList[
                                        AppCubit.get(context).stateindex],
                                    items: AppCubit.get(context)
                                        .stateList
                                        .map((item) => DropdownMenuItem<String>(
                                            value: item, child: Text(item)))
                                        .toList(),
                                    onChanged: (item) {
                                      AppCubit.get(context)
                                          .changstateindex(item!);
                                      cityController = item;
                                    }),
                              ),
                            ),
                            SizedBox(width: 10),
                            Expanded(
                                child: defaultextformfield(
                              onChange: (value) {
                                print(value);
                              },
                              onSubmit: (value) {
                                print(value);
                              },
                              validate: (value) {
                                if (value!.isEmpty) {
                                  return 'Refion mustn\'t be empty';
                                }
                                return null;
                              },
                              controlle: regionController,
                              type: TextInputType.text,
                              prefixIcon: Icons.place_outlined,
                              label: 'Region',
                            ))
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        ConditionalBuilderRec(
                            condition: state is! addadminInfoloadingfoState,
                            builder: (context) => defaultButton(
                                  width: double.infinity,
                                  height: 50,
                                  function: () {
                                    if (formkey.currentState!.validate()) {
                                      AppCubit.get(context).CreateProfileAdmin(
                                          token: accesstoken,
                                          business_name: businessname.text,
                                          phone_number: phoneController.text,
                                          city: cityController.toString(),
                                          region: regionController.text,
                                          logo_img_url:
                                              AppCubit.get(context).pickedfile);
                                    }
                                  },
                                  text: 'Done',
                                ),
                            fallback: (context) =>
                                Center(child: CircularProgressIndicator(),),),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
