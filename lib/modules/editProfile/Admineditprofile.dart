import 'dart:io';

import 'package:billingsystem/modules/profile_screen/profile.dart';
import 'package:billingsystem/shared/componentes/componentes.dart';
import 'package:billingsystem/shared/componentes/constance.dart';
import 'package:billingsystem/shared/cubit/app_cubit.dart';
import 'package:conditional_builder_rec/conditional_builder_rec.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:image_picker/image_picker.dart';

class editprofile extends StatelessWidget {
  List<String> items = [
    'Damascus',
    'Homs',
    'Hamah',
    'Daraa',
    'Allatikia',
    'Tartous',
    'Dir_ezzour',
    'Alhassaka',
    'Aleppo',
    'Rif_Damascus',
    'Alsouida',
    'Alqonaitra',
    'idleb',
  ];

  var businessname = TextEditingController();

  var phone = TextEditingController();
  var region = TextEditingController();
  var city;
  var logo;

  final formkey = GlobalKey<FormState>();

  bool ispass = true;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return BlocProvider(
        create: (context) => AppCubit(),
        child: BlocConsumer<AppCubit, AppState>(listener: (context, state) {
          if (state is EditprofileSucesses) {
            Fluttertoast.showToast(
                msg:
                    (AppCubit.get(context).editprofileAdmin.message).toString(),
                toastLength: Toast.LENGTH_LONG,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 5,
                backgroundColor: Colors.green,
                textColor: Colors.white,
                fontSize: 16.0);
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Profile()));
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
                              Icon(
                                Icons.arrow_left_sharp,
                                color: Colors.white,
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
                                child: Expanded(
                                  child: Column(
                                    children: [
                                      Center(
                                        child: MaterialButton(
                                            child: CircleAvatar(
                                                radius: 60,
                                                child: AppCubit.get(context)
                                                            .pickedfile ==
                                                        null
                                                    ? Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Icon(
                                                            Icons.camera_alt,
                                                            size: 50,
                                                          ),
                                                        ],
                                                      )
                                                    : null,
                                                backgroundImage: AppCubit.get(
                                                                context)
                                                            .pickedfile !=
                                                        null
                                                    ? Image(
                                                            image: FileImage(
                                                                AppCubit.get(
                                                                        context)
                                                                    .pickedfile!))
                                                        .image
                                                    : null),
                                            onPressed: () {
                                              AppCubit.get(context)
                                                  .changeLogo();
                                            }),
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      defaultextformfield(
                                          validate: (value) {},
                                          controlle: businessname,
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
                                          validate: (value) {},
                                          controlle: phone,
                                          type: TextInputType.text,
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
                                      DropdownButton<String>(
                                        value:
                                            AppCubit.get(context).dropindexedit,
                                        items: items
                                            .map((item) =>
                                                DropdownMenuItem<String>(
                                                    value: item,
                                                    child: Text(item)))
                                            .toList(),
                                        onChanged: (item) {
                                          AppCubit.get(context).dropindexedit =
                                              item!;
                                        },
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      defaultextformfield(
                                          validate: (value) {},
                                          controlle: region,
                                          type: TextInputType.text,
                                          onChange: (value) {
                                            print(value);
                                          },
                                          onSubmit: (value) {
                                            print(value);
                                          },
                                          label: 'region',
                                          prefixIcon:
                                              Icons.location_city_outlined,
                                          ispassword: false),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      ConditionalBuilderRec(
                                          condition:
                                              state is! EditprofileLoading,
                                          builder: (context) => defaultButton(
                                                width: double.infinity,
                                                height: 50,
                                                function: () {
                                                  if (formkey.currentState!
                                                      .validate()) {
                                                    AppCubit.get(context)
                                                        .admin_editprofile(
                                                            token: accesstoken,
                                                            business_name:
                                                                businessname
                                                                    .text,
                                                            phone: phone.text,
                                                            city: AppCubit.get(
                                                                    context)
                                                                .dropindexedit
                                                                .toString(),
                                                            region: region.text,
                                                            logo_url: AppCubit
                                                                    .get(
                                                                        context)
                                                                .pickedfile);

                                                    print(
                                                        'businessname : ${businessname.text}');
                                                  }
                                                },
                                                text: 'EDIT',
                                              ),
                                          fallback: (context) => Center(
                                              child:
                                                  CircularProgressIndicator())),
                                    ],
                                  ),
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
