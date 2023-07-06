import 'package:billingsystem/layout/app_layout.dart';
import 'package:billingsystem/modules/AddInvoice/item.dart';
import 'package:billingsystem/modules/AddInvoice/item_dialogo.dart';
import 'package:billingsystem/modules/invoices_screen/invoiceAdmin.dart';
import 'package:billingsystem/shared/componentes/componentes.dart';
import 'package:billingsystem/shared/cubit/app_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class dynlist extends StatefulWidget {
  //const dynlist({Key? key, this.idbil}) : super(key: key);
  final idbil;
  dynlist(this.idbil);
  @override
  State<dynlist> createState() => _dynlistState();
}

class _dynlistState extends State<dynlist> {
  List<item> itemlist = [];

  @override
  Widget build(BuildContext context) {
    widget.idbil;
    print('widgetid ${widget.idbil}');
    void additemdata(item item) {
      setState(() {
        itemlist.add(item);
      });
    }

    void showitemdialog() {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: add_item_dialogo(
                additemdata,
                widget.idbil,
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
            );
          });
    }

    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {
        if (state is sendinvoicesucssState) {
          Fluttertoast.showToast(
              msg: state.send.massage.toString(),
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 5,
              backgroundColor: Colors.green,
              textColor: Colors.white,
              fontSize: 16.0);
        } else if (state is sendinvoicerrorState) {
          Fluttertoast.showToast(
              msg: 'Error, Try Again'.toString(),
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
            floatingActionButton: FloatingActionButton(
              onPressed: showitemdialog,
              child: Icon(
                Icons.add,
              ),
              backgroundColor: Colors.green,
            ),
            appBar: AppBar(
              title: Text('ADD ITEMS'),
              backgroundColor: Colors.green,
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.75,
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        return Card(
                          margin: EdgeInsets.all(4),
                          elevation: 8,
                          child: ListTile(
                            title: Text(
                              itemlist[index].name,
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 22,
                                  color: Colors.green),
                            ),
                            subtitle: Text(itemlist[index].quantity,
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 18,
                                    color: Colors.black54)),
                            trailing: Text(itemlist[index].priceone,
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 18,
                                    color: Colors.black54)),
                          ),
                        );
                      },
                      itemCount: itemlist.length,
                    ),
                  ),
                  defaultButton(
                    width: 200,
                    height: 50,
                    function: () {
                      var usernamecontroller = TextEditingController();
                      AppCubit.get(context)
                          .calc(context: context, id: widget.idbil);
                      showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                                title: Text('Send This Invoice'),
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
                                          controlle: usernamecontroller,
                                          type: TextInputType.text,
                                          prefixIcon: Icons.person,
                                          label: 'User Name'),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      defaultButton(
                                          function: () {
                                            var user = usernamecontroller.text;
                                            print(user);
                                            AppCubit.get(context).sendinvoice(
                                                customername:
                                                    usernamecontroller.text,
                                                id: widget.idbil);
                                            Navigator.pop(context, appLayout());
                                          },
                                          text: 'send')
                                    ],
                                  )
                                ],
                              ));
                    },
                    text: 'Send invoice',
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
