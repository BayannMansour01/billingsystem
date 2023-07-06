import 'package:billingsystem/modules/AddInvoice/test.dart';
import 'package:billingsystem/shared/cubit/app_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/componentes/componentes.dart';

class basic_info extends StatelessWidget {
  List<String> items = [
    'unpaid',
    'paid',
  ];
  var dueatecontroller = TextEditingController();
  var user_name = TextEditingController();
  var Tax = TextEditingController();
  var state = TextEditingController();
  var formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => AppCubit(),
        child: BlocConsumer<AppCubit, AppState>(listener: (context, state) {
          if (state is creatBillsuccessState) {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => dynlist(state.creatres.billid)));
          }
        }, builder: (context, state) {
          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(20),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 20),
                    Text(
                      'ADD BASIC INFORMATION',
                      style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    defaultextformfield(
                        controlle: dueatecontroller,
                        validate: (value) {
                          if (value!.isEmpty) {
                            return 'mustn\'t be empty';
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
                        label: 'Due date',
                        prefixIcon: Icons.business_rounded,
                        ispassword: false),
                    SizedBox(
                      height: 20,
                    ),
                    defaultextformfield(
                        controlle: user_name,
                        validate: (value) {
                          if (value!.isEmpty) {
                            return 'mustn\'t be empty';
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
                        label: 'User Name',
                        prefixIcon: Icons.person,
                        ispassword: false),
                    SizedBox(
                      height: 20,
                    ),
                    defaultextformfield(
                        controlle: Tax,
                        validate: (value) {
                          if (value!.isEmpty) {
                            return 'mustn\'t be empty';
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
                        label: 'Tax',
                        prefixIcon: Icons.monetization_on,
                        ispassword: false),
                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        children: [
                          Text(
                            'Paiding Status',
                            style: TextStyle(
                                color: Colors.green,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 40,
                          ),
                          Container(
                            child: DropdownButton<String>(
                                iconEnabledColor: Colors.green,
                                value: AppCubit.get(context).dropindexstatus,
                                items: items
                                    .map((item) => DropdownMenuItem<String>(
                                        value: item, child: Text(item)))
                                    .toList(),
                                onChanged: (item) {
                                  AppCubit.get(context).changindex(item!);
                                }),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    defaultButton(
                      width: 200,
                      height: 50,
                      function: () {
                        AppCubit.get(context).creatbill(
                            context: context,
                            username: user_name.text,
                            duedate: dueatecontroller.text,
                            ratevat: Tax.text,
                            status: AppCubit.get(context)
                                .dropindexstatus
                                .toString());
                      },
                      text: 'ADD ITEMS',
                    ),
                  ],
                ),
              ),
            ),
          );
        }));
  }
}
