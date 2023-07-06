import 'package:billingsystem/models/sendCustomermodel.dart';
import 'package:billingsystem/shared/componentes/componentes.dart';
import 'package:billingsystem/shared/componentes/constance.dart';
import 'package:billingsystem/shared/cubit/app_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class reqestsAdmin extends StatelessWidget {
  @override
  var usernameController = TextEditingController();
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {
        if (state is sendRequestSuccessState) {
          print(state.res.message.toString());
          Fluttertoast.showToast(
              msg: state.res.message.toString(),
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 5,
              backgroundColor: Colors.green,
              textColor: Colors.white,
              fontSize: 16.0);
        } else if (state is sendRequestErrorState) {
          Fluttertoast.showToast(
              msg: 'Error, Try Again',
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 5,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0);
        }
      },
      builder: (context, state) {
        return BlocProvider(
          create: (context) => AppCubit(),
          child: Scaffold(
            appBar: AppBar(
              title: Title(color: Colors.green, child: Text('Add Freind')),
            ),
            body: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 1),
                  child: Center(
                    child: Text(
                      'Add Customer',
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(15, 20, 15, 0),
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 10,
                          color: Colors.grey.shade800,
                        )
                      ]),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MaterialButton(
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                        title: Text('Send New Request'),
                                        actions: <Widget>[
                                          Column(
                                            children: [
                                              Text(
                                                  'Enter the user name of your customer'),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              defaultextformfield(
                                                  onChange: (value) {
                                                    print(value);
                                                  },
                                                  onSubmit: (value) {
                                                    print(value);
                                                  },
                                                  controlle: usernameController,
                                                  type: TextInputType.text,
                                                  prefixIcon: Icons.person,
                                                  label: 'User Name'),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              defaultButton(
                                                  function: () {
                                                    var user =
                                                        usernameController.text;
                                                    print(user);

                                                    AppCubit.get(context)
                                                        .sendRequest(user);
                                                    Navigator.pop(context);
                                                  },
                                                  text: 'send')
                                            ],
                                          )
                                        ],
                                      ));
                            },
                            child: Container(
                              padding: EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                  color: Color(0xff453003).withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(4)),
                              child: Center(
                                child: Text(
                                  'Send Request',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText2!
                                      .copyWith(
                                          fontSize: 15,
                                          color: Colors.green,
                                          fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  Widget viewRequests(BuildContext context) {
    return Container(
        padding: EdgeInsets.fromLTRB(15, 20, 15, 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Requests',
              style: Theme.of(context).textTheme.bodyText2!.copyWith(
                  fontSize: 15,
                  color: Colors.green,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              'View All',
              style: Theme.of(context).textTheme.bodyText2!.copyWith(
                  fontSize: 15,
                  color: Colors.green,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ));
  }

  Widget gridviweitem(
      {required String namesender,
      required String Totalprice,
      required String logo,
      BuildContext? context}) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      elevation: 4,
      shadowColor: Colors.grey.shade100,
      child: Container(
        padding: EdgeInsets.only(top: 13),
        child: Column(
          children: [
            Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                color: Colors.green,
                image:
                    DecorationImage(image: AssetImage(logo), fit: BoxFit.cover),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              child: Text(
                namesender,
                style: Theme.of(context!).textTheme.bodyText2!.copyWith(
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
            Text(
              Totalprice,
              style: Theme.of(context).textTheme.bodyText2!.copyWith(
                    fontSize: 10,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
